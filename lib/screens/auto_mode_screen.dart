import 'dart:async';
import '../generated/l10n.dart';

import 'package:projey/models/telemetry_point.dart';
import 'package:projey/services/fake_server.dart';
import 'package:projey/services/telemetry_simulator.dart';
import 'package:projey/widgets/telemetry_chart.dart';
import 'package:flutter/material.dart';

// Screen that simulates the automatic mode of a sensor (temperature/humidity)
class AutoModeScreen extends StatefulWidget {
  const AutoModeScreen({super.key});

  @override
  State<AutoModeScreen> createState() => _AutoModeScreenState();
}

class _AutoModeScreenState extends State<AutoModeScreen> {
  final List<TelemetryPoint> _points = []; // Stores the telemetry history
  late TelemetrySimulator _simulator;      // Generates simulated data
  final FakeServer _server = FakeServer(); // Mock server to get attributes
  bool isActiveMode = true;                // Determines if the sensor is in active or standby mode
  double? _lastTemp;                       // Last received temperature
  double? _lastHum;                        // Last received humidity
  String _unit = "°C";                     // Current temperature unit
  Timer? _pollingTimer;                    // Timer to periodically poll the server

  @override
  void initState() {
    super.initState();
    _startSimulator();                    // Starts generating data
    _startPollingServerAttributes();     // Starts polling for unit updates
  }

  // Starts the simulator with the appropriate intervals based on mode
  void _startSimulator() {
    _simulator = TelemetrySimulator(
      onNewData: _handleNewData,
      tempInterval: isActiveMode ? const Duration(seconds: 10) : const Duration(seconds: 20),
      humInterval: isActiveMode ? const Duration(seconds: 20) : const Duration(seconds: 50),
    );
    _simulator.start();
  }

  // Polls the mock server periodically to update the unit
  void _startPollingServerAttributes() {
    _pollingTimer?.cancel();
    final interval = isActiveMode ? const Duration(seconds: 10) : const Duration(seconds: 20);
    _pollingTimer = Timer.periodic(interval, (_) async {
      final attributes = await _server.getAttributes();
      setState(() {
        _unit = attributes['temperatureUnit'] as String;
      });
    });
  }

  // Handles new data received from the simulator
  void _handleNewData(double temp, double hum) {
    setState(() {
      if (temp != -1) _lastTemp = temp;
      if (hum != -1) _lastHum = hum;

      if (_lastTemp != null && _lastHum != null) {
        _points.add(
          TelemetryPoint(
            timestamp: DateTime.now(),
            temperature: _lastTemp!,
            humidity: _lastHum!,
          ),
        );

        if (_points.length > 20) {
          _points.removeAt(0); // Limit to 20 points
        }
      }
    });
  }

  // Toggles between active and standby mode
  void _toggleMode(bool value) {
    setState(() {
      isActiveMode = value;
      _simulator.stop();
      _pollingTimer?.cancel();
      _startSimulator();
      _startPollingServerAttributes();
    });
  }

  @override
  void dispose() {
    _simulator.stop(); // Cleanup timers
    _pollingTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(S.of(context).autoModeTitle)),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Display current sending intervals and temperature unit
              Text('${S.of(context).autoModeUpdateInfo(isActiveMode ? "10/20" : "20/50")}'),
              Text('${S.of(context).autoModeTemperatureUnit(_unit)}'),
              const SizedBox(height: 10),

              // Toggle for switching mode
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(S.of(context).autoModeActive),
                  Switch(
                    value: isActiveMode,
                    onChanged: _toggleMode,
                  ),
                  Text(S.of(context).autoModeStandby),
                ],
              ),
              const SizedBox(height: 20),

              // Display telemetry chart
              Expanded(
                child: TelemetryChart(
                  points: _points,
                  unit: _unit,
                ),
              ),
            ],
          ),
        ),
      );
}

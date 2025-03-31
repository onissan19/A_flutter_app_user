import 'dart:async';

import 'package:flutter/material.dart';
import '../models/telemetry_point.dart';
import '../services/telemetry_simulator.dart';
import '../services/fake_server.dart';
import '../widgets/telemetry_chart.dart';

class AutoModeScreen extends StatefulWidget {
  @override
  State<AutoModeScreen> createState() => _AutoModeScreenState();
}

class _AutoModeScreenState extends State<AutoModeScreen> {
  final List<TelemetryPoint> _points = [];
  late TelemetrySimulator _simulator;
  final FakeServer _server = FakeServer();
  bool isActiveMode = true;
  double? _lastTemp;
  double? _lastHum;
  String _unit = "°C";
  Timer? _pollingTimer;

  @override
  void initState() {
    super.initState();
    _startSimulator();
    _startPollingServerAttributes();
  }

  void _startSimulator() {
    _simulator = TelemetrySimulator(
      onNewData: _handleNewData,
      tempInterval: isActiveMode ? Duration(seconds: 10) : Duration(seconds: 20),
      humInterval: isActiveMode ? Duration(seconds: 20) : Duration(seconds: 50),
    );
    _simulator.start();
  }

  void _startPollingServerAttributes() {
    _pollingTimer?.cancel();
    final interval = isActiveMode ? Duration(seconds: 10) : Duration(seconds: 20);
    _pollingTimer = Timer.periodic(interval, (_) async {
      final attributes = await _server.getAttributes();
      setState(() {
        _unit = attributes['temperatureUnit'] as String;
      });
    });
  }

  void _handleNewData(double temp, double hum) {
    setState(() {
      if (temp != -1) _lastTemp = temp;
      if (hum != -1) _lastHum = hum;

      if (_lastTemp != null && _lastHum != null) {
        _points.add(TelemetryPoint(
          timestamp: DateTime.now(),
          temperature: _lastTemp!,
          humidity: _lastHum!,
        ));
        if (_points.length > 20) _points.removeAt(0);
      }
    });
  }

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
    _simulator.stop();
    _pollingTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mode Automatique')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Données mises à jour toutes les ${isActiveMode ? "10/20" : "20/50"} secondes (T/H).'),
            Text('Unité température : $_unit'),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Mode Actif'),
                Switch(
                  value: isActiveMode,
                  onChanged: _toggleMode,
                ),
                Text('Mode Veille'),
              ],
            ),
            SizedBox(height: 20),
            Expanded(child: TelemetryChart(points: _points, unit: _unit)),
          ],
        ),
      ),
    );
  }
}
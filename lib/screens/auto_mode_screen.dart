import 'package:flutter/material.dart';
import '../models/telemetry_point.dart';
import '../services/telemetry_simulator.dart';
import '../widgets/telemetry_chart.dart';

class AutoModeScreen extends StatefulWidget {
  @override
  State<AutoModeScreen> createState() => _AutoModeScreenState();
}

class _AutoModeScreenState extends State<AutoModeScreen> {
  final List<TelemetryPoint> _points = [];
  late TelemetrySimulator _simulator;

  @override
  void initState() {
    super.initState();
    _simulator = TelemetrySimulator(onNewData: (temp, hum) {
      setState(() {
        _points.add(TelemetryPoint(
          timestamp: DateTime.now(),
          temperature: temp,
          humidity: hum,
        ));
        if (_points.length > 20) _points.removeAt(0);
      });
    });
    _simulator.start();
  }

  @override
  void dispose() {
    _simulator.stop();
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
            Text('Les données sont mises à jour toutes les 10 secondes.'),
            SizedBox(height: 20),
            Expanded(child: TelemetryChart(points: _points)),
          ],
        ),
      ),
    );
  }
}
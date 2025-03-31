import 'package:flutter/material.dart';
import '../models/telemetry_point.dart';
import '../widgets/data_input_form.dart';
import '../widgets/telemetry_chart.dart';

class ManualModeScreen extends StatefulWidget {
  @override
  State<ManualModeScreen> createState() => _ManualModeScreenState();
}

class _ManualModeScreenState extends State<ManualModeScreen> {
  final List<TelemetryPoint> _points = [];

  void _addPoint(double temperature, double humidity) {
    setState(() {
      _points.add(TelemetryPoint(
        timestamp: DateTime.now(),
        temperature: temperature,
        humidity: humidity,
      ));
      if (_points.length > 20) _points.removeAt(0); // Garder les 20 dernières valeurs
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mode Manuel')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DataInputForm(onSubmit: _addPoint),
            SizedBox(height: 20),
            Expanded(child: TelemetryChart(points: _points)),
          ],
        ),
      ),
    );
  }
}
// Import telemetry model, input form, and chart widget
import 'package:projey/models/telemetry_point.dart';
import 'package:projey/widgets/data_input_form.dart';
import 'package:projey/widgets/telemetry_chart.dart';
import 'package:flutter/material.dart';
import 'package:projey/generated/l10n.dart';

// Screen for manual mode (user input)
class ManualModeScreen extends StatefulWidget {
  const ManualModeScreen({super.key});

  @override
  State<ManualModeScreen> createState() => _ManualModeScreenState();
}

class _ManualModeScreenState extends State<ManualModeScreen> {
  // Stores the list of manually entered telemetry points
  final List<TelemetryPoint> _points = [];

  // Called when a new point is submitted
  void _addPoint(double temperature, double humidity) {
    setState(() {
      _points.add(TelemetryPoint(
        timestamp: DateTime.now(), // Timestamp when the data is added
        temperature: temperature,
        humidity: humidity,
      ));

      // Limit to 20 points to keep chart clean
      if (_points.length > 20) {
        _points.removeAt(0);
      }
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(S.of(context).manualModeTitle)),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Temperature & humidity input form
              DataInputForm(onSubmit: _addPoint),

              const SizedBox(height: 20),

              // Telemetry chart showing submitted data
              Expanded(child: TelemetryChart(points: _points)),
            ],
          ),
        ),
      );

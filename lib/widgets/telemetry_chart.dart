import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../models/telemetry_point.dart';

class TelemetryChart extends StatelessWidget {
  final List<TelemetryPoint> points;

  const TelemetryChart({required this.points, super.key});

  @override
  Widget build(BuildContext context) {
    List<FlSpot> tempSpots = [];
    List<FlSpot> humiditySpots = [];

    for (int i = 0; i < points.length; i++) {
      tempSpots.add(FlSpot(i.toDouble(), points[i].temperature));
      humiditySpots.add(FlSpot(i.toDouble(), points[i].humidity));
    }

    return LineChart(
      LineChartData(
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true, reservedSize: 40),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: tempSpots,
            isCurved: true,
            color: Colors.red,
            barWidth: 2,
            dotData: FlDotData(show: false),
          ),
          LineChartBarData(
            spots: humiditySpots,
            isCurved: true,
            color: Colors.blue,
            barWidth: 2,
            dotData: FlDotData(show: false),
          ),
        ],
        gridData: FlGridData(show: true),
        borderData: FlBorderData(show: true),
        minY: 0,
        maxY: 40,
      ),
    );
  }
}
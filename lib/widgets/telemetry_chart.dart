import 'package:projey/models/telemetry_point.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:projey/generated/l10n.dart';

/// Widget that displays a line chart for temperature and humidity data
class TelemetryChart extends StatelessWidget {
  final List<TelemetryPoint> points;
  final String unit;

  /// Accepts a list of telemetry points and the temperature unit label to display (°C or °F)
  const TelemetryChart({required this.points, this.unit = "°C", super.key});

  @override
  Widget build(BuildContext context) {
    final tempSpots = <FlSpot>[];      // Data points for the temperature curve
    final humiditySpots = <FlSpot>[];  // Data points for the humidity curve

    // Convert telemetry points into FlSpot for the chart
    for (var i = 0; i < points.length; i++) {
      tempSpots.add(FlSpot(i.toDouble(), points[i].temperature));
      humiditySpots.add(FlSpot(i.toDouble(), points[i].humidity));
    }

    return LineChart(
      LineChartData(
        titlesData: const FlTitlesData(
          bottomTitles: AxisTitles(), // No labels on X-axis for now
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true, reservedSize: 40),
          ),
          rightTitles: AxisTitles(),
          topTitles: AxisTitles(),
        ),
        lineBarsData: [
          // Red line for temperature
          LineChartBarData(
            spots: tempSpots,
            isCurved: true,
            color: Colors.red,
            belowBarData: BarAreaData(), // No filled area under the curve
          ),
          // Blue line for humidity
          LineChartBarData(
            spots: humiditySpots,
            isCurved: true,
            color: Colors.blue,
            belowBarData: BarAreaData(),
          ),
        ],
        borderData: FlBorderData(show: true), // Show graph borders
        minY: 0,  // Minimum Y-axis value
        maxY: 40, // Max Y value fixed here — should adapt to °F if needed

        // Tooltip config when touching a graph point
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: Colors.grey.shade700,
            getTooltipItems: (touchedSpots) => touchedSpots.map((spot) {
              final isTemp = spot.bar.color == Colors.red;
              final t = S.of(context);
              final label = isTemp
                ? t.chartTemperatureTooltip(spot.y.toStringAsFixed(1), unit)
                : t.chartHumidityTooltip(spot.y.toStringAsFixed(1));
              return LineTooltipItem(label, const TextStyle(color: Colors.white));
            }).toList(),
          ),
        ),
      ),
    );
  }
}

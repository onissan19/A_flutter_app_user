class TelemetryPoint {
  final DateTime timestamp;
  final double temperature;
  final double humidity;

  TelemetryPoint({
    required this.timestamp,
    required this.temperature,
    required this.humidity,
  });
}
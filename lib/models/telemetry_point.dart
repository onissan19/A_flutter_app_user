// Represents a single telemetry data point recorded by the sensor
class TelemetryPoint {
  // The timestamp when the data was recorded
  final DateTime timestamp;

  // The measured temperature (in °C by default)
  final double temperature;

  // The measured humidity (in %)
  final double humidity;

  // Constructor: requires timestamp, temperature, and humidity to create a data point
  TelemetryPoint({
    required this.timestamp,
    required this.temperature,
    required this.humidity,
  });
}

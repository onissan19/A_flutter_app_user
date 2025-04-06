import 'dart:async';
import 'dart:math';

/// This class simulates a sensor that periodically generates temperature and humidity data
class TelemetrySimulator {
  // Callback function triggered on each new data generation
  final Function(double, double) onNewData;

  // Frequency for temperature data
  final Duration tempInterval;

  // Frequency for humidity data
  final Duration humInterval;

  Timer? _tempTimer;
  Timer? _humTimer;
  final Random _random = Random();

  TelemetrySimulator({
    required this.onNewData,
    required this.tempInterval,
    required this.humInterval,
  });

  /// Starts two timers: one for temperature, one for humidity
  void start() {
    _tempTimer = Timer.periodic(tempInterval, (_) {
      // Generates a random temperature between 10.0 and 30.0 (precision 0.1)
      final temp = double.parse((10 + _random.nextDouble() * 20).toStringAsFixed(1));
      // Calls the callback with -1 for humidity (not updated here)
      onNewData(temp, -1);
    });

    _humTimer = Timer.periodic(humInterval, (_) {
      // Generates a random humidity between 10% and 30% (precision 0.1)
      final hum = double.parse((10 + _random.nextDouble() * 20).toStringAsFixed(1));
      // Calls the callback with -1 for temperature (not updated here)
      onNewData(-1, hum);
    });
  }

  /// Stops both timers
  void stop() {
    _tempTimer?.cancel();
    _humTimer?.cancel();
  }
}

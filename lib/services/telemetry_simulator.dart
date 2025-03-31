import 'dart:async';
import 'dart:math';

class TelemetrySimulator {
  final Function(double, double) onNewData;
  final Duration tempInterval;
  final Duration humInterval;

  Timer? _tempTimer;
  Timer? _humTimer;
  final Random _random = Random();

  TelemetrySimulator({
    required this.onNewData,
    required this.tempInterval,
    required this.humInterval,
  });

  void start() {
    _tempTimer = Timer.periodic(tempInterval, (_) {
      double temp = double.parse((10 + _random.nextDouble() * 20).toStringAsFixed(1));
      onNewData(temp, -1); // -1 = pas de nouvelle humidité
    });

    _humTimer = Timer.periodic(humInterval, (_) {
      double hum = double.parse((10 + _random.nextDouble() * 20).toStringAsFixed(1));
      onNewData(-1, hum); // -1 = pas de nouvelle température
    });
  }

  void stop() {
    _tempTimer?.cancel();
    _humTimer?.cancel();
  }
}
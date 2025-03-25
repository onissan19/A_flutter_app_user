import 'dart:async';
import 'dart:math';

class TelemetrySimulator {
  final Function(double, double) onNewData;
  late Timer _timer;
  final Random _random = Random();

  TelemetrySimulator({required this.onNewData});

  void start() {
    _timer = Timer.periodic(Duration(seconds: 10), (_) {
      double temp = double.parse((10 + _random.nextDouble() * 20).toStringAsFixed(1));
      double hum = double.parse((10 + _random.nextDouble() * 20).toStringAsFixed(1));
      onNewData(temp, hum);
    });
  }

  void stop() {
    _timer.cancel();
  }
}
import 'dart:async';
import 'dart:math';

void main() {
  bool actif = true; // Mode actif par défaut
  Timer? timer;

  void startSimulation() {
    timer?.cancel(); // Annule le précédent timer s'il existe
    int interval = actif ? 10 : 20; // 10s en mode actif, 20s en mode veille

    timer = Timer.periodic(Duration(seconds: interval), (Timer t) {
      double temperature = (15 + Random().nextDouble() * 15).toDouble();
      double humidite = (30 + Random().nextInt(41)).toDouble();
      print("Température: ${temperature.toStringAsFixed(1)}°C, Humidité: ${humidite.toStringAsFixed(0)}%");
    });
  }

  startSimulation();

  // Simulation d'un changement de mode après 30 secondes
  Timer(Duration(seconds: 30), () {
    actif = !actif;
    print("Mode changé : ${actif ? "Actif" : "Veille"}");
    startSimulation();
  });
}

import 'dart:async';

class FakeServer {
  String _unit = "°F";

  // Simule le changement d'unité (si besoin)
  void setUnit(String newUnit) {
    _unit = newUnit;
  }

  // Renvoie les attributs comme si c'était une réponse serveur
  Future<Map<String, dynamic>> getAttributes() async {
    await Future.delayed(Duration(milliseconds: 200)); // simulate delay
    return {
      'temperatureUnit': _unit,
    };
  }
}

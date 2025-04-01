import 'package:flutter/material.dart';
import 'package:projey/screens/home_screen.dart';

class TemperaturePage extends StatelessWidget {
  const TemperaturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeScreen(); // <- Utilise directement l'écran du capteur
  }
}

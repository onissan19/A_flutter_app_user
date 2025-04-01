import 'dart:async';
import 'package:flutter/material.dart';
import 'login_page.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(); // Fait tourner le "D"

    Timer(const Duration(seconds: 3), () {
      _controller.stop();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Image "NEW" fixe
            Positioned(
              left: MediaQuery.of(context).size.width * 0.3,
              child: Image.asset(
                'assets/images/new.png',
                width: 130,
                fit: BoxFit.contain,
              ),
            ),

            // Image "D" en rotation
            Positioned(
              left: MediaQuery.of(context).size.width * 0.45,
              child: RotationTransition(
                turns: _controller,
                child: Image.asset(
                  'assets/images/d.png',
                  width: 180,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

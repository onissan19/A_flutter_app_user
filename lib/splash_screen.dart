import 'dart:async';
import 'package:flutter/material.dart';
import 'login_page.dart';

/// Splash screen that displays an animated logo before redirecting to the login page.
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

    // Initializes an animation controller to rotate the "D" image.
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    // After 3 seconds, stop the animation and navigate to the LoginPage.
    Timer(const Duration(seconds: 3), () {
      _controller.stop();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the animation controller when the widget is removed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background of splash screen
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Fixed image "NEW" positioned more to the left
            Positioned(
              left: MediaQuery.of(context).size.width * 0.3,
              child: Image.asset(
                'assets/images/new.png',
                width: 130,
                fit: BoxFit.contain,
              ),
            ),

            // Rotating image "D" layered on top
            Positioned(
              left: MediaQuery.of(context).size.width * 0.45,
              child: RotationTransition(
                turns: _controller, // Animation controller for rotation
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

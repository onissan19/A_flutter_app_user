import 'package:flutter/material.dart';
import 'manual_mode_screen.dart';
import 'auto_mode_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mode de fonctionnement')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: Icon(Icons.edit),
              label: Text('Mode Manuel'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ManualModeScreen()),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(Icons.auto_mode),
              label: Text('Mode Automatique'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AutoModeScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:projey/screens/auto_mode_screen.dart';
import 'package:projey/screens/manual_mode_screen.dart';
import 'package:projey/generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = S.of(context); // Localization object

    return Scaffold(
      appBar: AppBar(
        title: Text(t.homeTitle), // Dynamic title from translations
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Button to navigate to Manual Mode
            ElevatedButton.icon(
              icon: const Icon(Icons.edit),
              label: Text(t.homeManualMode),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ManualModeScreen()),
                );
              },
            ),
            const SizedBox(height: 20),

            // Button to navigate to Auto Mode
            ElevatedButton.icon(
              icon: const Icon(Icons.auto_mode),
              label: Text(t.homeAutoMode),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AutoModeScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

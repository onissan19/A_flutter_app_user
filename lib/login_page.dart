import 'package:flutter/material.dart';
import 'home_page.dart';
import 'generated/l10n.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = S.of(context); // gets translated strings

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t.login, // "Login" title
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Email input field
            const TextField(
              decoration: InputDecoration(
                labelText: "Email", // <-- can also be localized
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            // Password input field
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Mot de passe", // <-- can also be localized
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            // Forgot password link
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(t.forgotPassword),
              ),
            ),
            const SizedBox(height: 20),

            // Login button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: Text(t.login),
              ),
            ),
            const SizedBox(height: 12),

            // Create account link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(t.noAccount),
                TextButton(
                  onPressed: () {},
                  child: Text(t.createAccount),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

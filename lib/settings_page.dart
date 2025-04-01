import 'package:flutter/material.dart';
import 'generated/l10n.dart'; // flutter_intl
import 'main.dart'; // pour appeler MyApp.setLocale

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _language = 'fr';
  bool _isDarkMode = false;
  String _temperatureUnit = 'Celsius';

  @override
  Widget build(BuildContext context) {
    final t = S.of(context); // raccourci pour les traductions

    return Scaffold(
      appBar: AppBar(
        title: Text(t.settings),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          // Langue
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(t.language),
            trailing: DropdownButton<String>(
              value: _language,
              items: [
                DropdownMenuItem(value: 'fr', child: const Text('Français')),
                DropdownMenuItem(value: 'en', child: const Text('English')),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _language = value;
                    MyApp.setLocale(context, Locale(_language));
                  });
                }
              },
            ),
          ),

          // Mode sombre
          SwitchListTile(
            secondary: const Icon(Icons.brightness_6),
            title: Text(t.darkMode),
            value: _isDarkMode,
            onChanged: (value) {
              setState(() {
                _isDarkMode = value;
                MyApp.setThemeMode(context, value ? ThemeMode.dark : ThemeMode.light);
              });
            },
          ),

          // Unité de température
          ListTile(
            leading: const Icon(Icons.thermostat),
            title: Text(t.temperatureUnit),
            trailing: DropdownButton<String>(
              value: _temperatureUnit,
              items: const [
                DropdownMenuItem(value: 'Celsius', child: Text('°C')),
                DropdownMenuItem(value: 'Fahrenheit', child: Text('°F')),
              ],
              onChanged: (value) {
                setState(() {
                  _temperatureUnit = value!;
                  // TODO: Envoyer la valeur au serveur plus tard
                });
              },
            ),
          ),

          const Divider(),

          // Déconnexion
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text(t.logout),
            onTap: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          ),
        ],
      ),
    );
  }
}

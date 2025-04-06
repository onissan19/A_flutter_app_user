import 'package:flutter/material.dart';
import 'generated/l10n.dart'; // For localization using flutter_intl
import 'main.dart'; // To call MyApp.setLocale and MyApp.setThemeMode

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _language = 'fr'; // Default language
  bool _isDarkMode = false; // Default theme mode (light)
  String _temperatureUnit = 'Celsius'; // Default temperature unit

  @override
  Widget build(BuildContext context) {
    final t = S.of(context); // Shortcut to access localized strings

    return Scaffold(
      appBar: AppBar(
        title: Text(t.settings), // Page title
        centerTitle: true,
      ),
      body: ListView(
        children: [
          // Language selector
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
                    // Change app locale dynamically
                    MyApp.setLocale(context, Locale(_language));
                  });
                }
              },
            ),
          ),

          // Dark mode switch
          SwitchListTile(
            secondary: const Icon(Icons.brightness_6),
            title: Text(t.darkMode),
            value: _isDarkMode,
            onChanged: (value) {
              setState(() {
                _isDarkMode = value;
                // Dynamically change theme between light and dark
                MyApp.setThemeMode(context, value ? ThemeMode.dark : ThemeMode.light);
              });
            },
          ),

          // Temperature unit selector (Celsius or Fahrenheit)
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
                  // TODO: Send value to backend or update global state
                });
              },
            ),
          ),

          const Divider(),

          // Logout action
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text(t.logout),
            onTap: () {
              // Return to the first page (login or splash)
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'settings_page.dart';
import 'generated/l10n.dart';
import 'temperature_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Store objects with fixed IDs
  final List<Map<String, String>> allThings = [
    {'id': 'temperature', 'labelKey': 'sensorTemperature'},
    {'id': 'humidity', 'labelKey': 'sensorHumidity'},
  ];

  final List<String> filterOptions = ['all', 'temperature', 'humidity'];
  String selectedFilter = 'all';

  List<Map<String, String>> filteredThings = [];

  @override
  void initState() {
    super.initState();
    filteredThings = List.from(allThings); // Show everything by default
  }

  void _filterThings(String type) {
    setState(() {
      selectedFilter = type;
      if (type == 'all') {
        filteredThings = List.from(allThings);
      } else {
        filteredThings = allThings.where((thing) => thing['id'] == type).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = S.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    // ID => translated label
    final labelTranslations = {
      'all': t.filterOptionAll,
      'temperature': t.filterOptionTemperature,
      'humidity': t.filterOptionHumidity,
      'sensorTemperature': t.sensorTemperature,
      'sensorHumidity': t.sensorHumidity,
    };

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorScheme.primary,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/d.png'),
        ),
        title: Text(
          t.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: colorScheme.onPrimary,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: colorScheme.onPrimary),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(Icons.filter_list, color: colorScheme.onBackground),
                const SizedBox(width: 10),
                Text(
                  "${t.filterByType} :",
                  style: TextStyle(fontWeight: FontWeight.w500, color: colorScheme.onBackground),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedFilter,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: colorScheme.surface,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                    dropdownColor: colorScheme.surface,
                    iconEnabledColor: colorScheme.onSurface,
                    style: TextStyle(color: colorScheme.onSurface),
                    items: filterOptions.map((filterId) {
                      return DropdownMenuItem(
                        value: filterId,
                        child: Text(labelTranslations[filterId]!),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) _filterThings(value);
                    },
                  ),
                )
              ],
            ),
          ),

          // List of sensors based on selected filter
          Expanded(
            child: ListView.builder(
              itemCount: filteredThings.length,
              itemBuilder: (context, index) {
                final thing = filteredThings[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: Card(
                    color: colorScheme.surfaceVariant,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      leading: CircleAvatar(
                        radius: 24,
                        backgroundColor: colorScheme.primaryContainer,
                        child: Icon(Icons.sensors, color: colorScheme.onPrimaryContainer),
                      ),
                      title: Text(
                        labelTranslations[thing['labelKey']]!,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios, size: 18, color: colorScheme.onSurface),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const TemperaturePage()),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

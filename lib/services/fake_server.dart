import 'dart:async';

class FakeServer {
  String _unit = "°F"; // Default temperature unit

  // Simulates changing the temperature unit
  // ignore: public_member_api_docs, use_setters_to_change_properties
  void setUnit(String newUnit) {
    _unit = newUnit;
  }

  // Simulates a server response with current attributes
  Future<Map<String, dynamic>> getAttributes() async {
    await Future.delayed(const Duration(milliseconds: 200)); // simulate network delay
    return {
      'temperatureUnit': _unit,
    };
  }
}

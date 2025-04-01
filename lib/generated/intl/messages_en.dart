// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(unit) => "Temperature unit: ${unit}";

  static String m1(interval) => "Data updated every ${interval} seconds (T/H).";

  static String m2(value) => "Hum: ${value} %";

  static String m3(value, unit) => "Temp: ${value} ${unit}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appTitle": MessageLookupByLibrary.simpleMessage("IoT App"),
        "autoModeActive": MessageLookupByLibrary.simpleMessage("Active Mode"),
        "autoModeStandby": MessageLookupByLibrary.simpleMessage("Standby Mode"),
        "autoModeTemperatureUnit": m0,
        "autoModeTitle": MessageLookupByLibrary.simpleMessage("Automatic Mode"),
        "autoModeUpdateInfo": m1,
        "chartHumidityTooltip": m2,
        "chartTemperatureTooltip": m3,
        "createAccount": MessageLookupByLibrary.simpleMessage("Create account"),
        "darkMode": MessageLookupByLibrary.simpleMessage("Dark Mode"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "filterAll": MessageLookupByLibrary.simpleMessage("All"),
        "filterByType": MessageLookupByLibrary.simpleMessage("Filter by type"),
        "filterHumidity": MessageLookupByLibrary.simpleMessage("Humidity"),
        "filterOptionAll": MessageLookupByLibrary.simpleMessage("All"),
        "filterOptionHumidity":
            MessageLookupByLibrary.simpleMessage("Humidity"),
        "filterOptionTemperature":
            MessageLookupByLibrary.simpleMessage("Temperature"),
        "filterTemperature":
            MessageLookupByLibrary.simpleMessage("Temperature"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot password?"),
        "formAddButton": MessageLookupByLibrary.simpleMessage("Add"),
        "formHumidityEmpty":
            MessageLookupByLibrary.simpleMessage("Enter a humidity value"),
        "formHumidityLabel":
            MessageLookupByLibrary.simpleMessage("Humidity (%)"),
        "formInvalidValue":
            MessageLookupByLibrary.simpleMessage("Invalid value"),
        "formTemperatureEmpty":
            MessageLookupByLibrary.simpleMessage("Enter a temperature"),
        "formTemperatureLabel":
            MessageLookupByLibrary.simpleMessage("Temperature (°C)"),
        "homeAutoMode": MessageLookupByLibrary.simpleMessage("Automatic Mode"),
        "homeManualMode": MessageLookupByLibrary.simpleMessage("Manual Mode"),
        "homeTitle": MessageLookupByLibrary.simpleMessage("Operating Mode"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "logout": MessageLookupByLibrary.simpleMessage("Logout"),
        "manualModeTitle": MessageLookupByLibrary.simpleMessage("Manual Mode"),
        "noAccount": MessageLookupByLibrary.simpleMessage("No account?"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "sensorHumidity":
            MessageLookupByLibrary.simpleMessage("Humidity Sensor"),
        "sensorTemperature":
            MessageLookupByLibrary.simpleMessage("Temperature Sensor"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "temperatureUnit":
            MessageLookupByLibrary.simpleMessage("Temperature Unit"),
        "title": MessageLookupByLibrary.simpleMessage("My Devices")
      };
}

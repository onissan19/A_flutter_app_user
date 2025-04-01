// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
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
  String get localeName => 'fr';

  static String m0(unit) => "Unité température : ${unit}";

  static String m1(interval) =>
      "Données mises à jour toutes les ${interval} secondes (T/H).";

  static String m2(value) => "Humidité : ${value} %";

  static String m3(value, unit) => "Température : ${value} ${unit}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appTitle": MessageLookupByLibrary.simpleMessage("Application IoT"),
        "autoModeActive": MessageLookupByLibrary.simpleMessage("Mode Actif"),
        "autoModeStandby": MessageLookupByLibrary.simpleMessage("Mode Veille"),
        "autoModeTemperatureUnit": m0,
        "autoModeTitle":
            MessageLookupByLibrary.simpleMessage("Mode Automatique"),
        "autoModeUpdateInfo": m1,
        "chartHumidityTooltip": m2,
        "chartTemperatureTooltip": m3,
        "createAccount":
            MessageLookupByLibrary.simpleMessage("Créer un compte"),
        "darkMode": MessageLookupByLibrary.simpleMessage("Mode sombre"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "filterAll": MessageLookupByLibrary.simpleMessage("Tous"),
        "filterByType":
            MessageLookupByLibrary.simpleMessage("Filtrer par type"),
        "filterHumidity": MessageLookupByLibrary.simpleMessage("Humidité"),
        "filterOptionAll": MessageLookupByLibrary.simpleMessage("Tous"),
        "filterOptionHumidity":
            MessageLookupByLibrary.simpleMessage("Humidité"),
        "filterOptionTemperature":
            MessageLookupByLibrary.simpleMessage("Température"),
        "filterTemperature":
            MessageLookupByLibrary.simpleMessage("Température"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Mot de passe oublié ?"),
        "formAddButton": MessageLookupByLibrary.simpleMessage("Ajouter"),
        "formHumidityEmpty":
            MessageLookupByLibrary.simpleMessage("Entrez une humidité"),
        "formHumidityLabel":
            MessageLookupByLibrary.simpleMessage("Humidité (%)"),
        "formInvalidValue":
            MessageLookupByLibrary.simpleMessage("Valeur invalide"),
        "formTemperatureEmpty":
            MessageLookupByLibrary.simpleMessage("Entrez une température"),
        "formTemperatureLabel":
            MessageLookupByLibrary.simpleMessage("Température (°C)"),
        "homeAutoMode":
            MessageLookupByLibrary.simpleMessage("Mode Automatique"),
        "homeManualMode": MessageLookupByLibrary.simpleMessage("Mode Manuel"),
        "homeTitle":
            MessageLookupByLibrary.simpleMessage("Mode de fonctionnement"),
        "language": MessageLookupByLibrary.simpleMessage("Langue"),
        "login": MessageLookupByLibrary.simpleMessage("Connexion"),
        "logout": MessageLookupByLibrary.simpleMessage("Déconnexion"),
        "manualModeTitle": MessageLookupByLibrary.simpleMessage("Mode Manuel"),
        "noAccount":
            MessageLookupByLibrary.simpleMessage("Pas encore de compte ?"),
        "password": MessageLookupByLibrary.simpleMessage("Mot de passe"),
        "sensorHumidity":
            MessageLookupByLibrary.simpleMessage("Capteur Humidité"),
        "sensorTemperature":
            MessageLookupByLibrary.simpleMessage("Capteur Température"),
        "settings": MessageLookupByLibrary.simpleMessage("Paramètres"),
        "temperatureUnit":
            MessageLookupByLibrary.simpleMessage("Unité de température"),
        "title": MessageLookupByLibrary.simpleMessage("Mes objets")
      };
}

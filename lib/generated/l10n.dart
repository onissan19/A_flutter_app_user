// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `IoT App`
  String get appTitle {
    return Intl.message(
      'IoT App',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message(
      'Dark Mode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `Temperature Unit`
  String get temperatureUnit {
    return Intl.message(
      'Temperature Unit',
      name: 'temperatureUnit',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `No account?`
  String get noAccount {
    return Intl.message(
      'No account?',
      name: 'noAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get createAccount {
    return Intl.message(
      'Create account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `My Devices`
  String get title {
    return Intl.message(
      'My Devices',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Filter by type`
  String get filterByType {
    return Intl.message(
      'Filter by type',
      name: 'filterByType',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get filterOptionAll {
    return Intl.message(
      'All',
      name: 'filterOptionAll',
      desc: '',
      args: [],
    );
  }

  /// `Temperature`
  String get filterOptionTemperature {
    return Intl.message(
      'Temperature',
      name: 'filterOptionTemperature',
      desc: '',
      args: [],
    );
  }

  /// `Humidity`
  String get filterOptionHumidity {
    return Intl.message(
      'Humidity',
      name: 'filterOptionHumidity',
      desc: '',
      args: [],
    );
  }

  /// `Automatic Mode`
  String get autoModeTitle {
    return Intl.message(
      'Automatic Mode',
      name: 'autoModeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Data updated every {interval} seconds (T/H).`
  String autoModeUpdateInfo(Object interval) {
    return Intl.message(
      'Data updated every $interval seconds (T/H).',
      name: 'autoModeUpdateInfo',
      desc: '',
      args: [interval],
    );
  }

  /// `Temperature unit: {unit}`
  String autoModeTemperatureUnit(Object unit) {
    return Intl.message(
      'Temperature unit: $unit',
      name: 'autoModeTemperatureUnit',
      desc: '',
      args: [unit],
    );
  }

  /// `Active Mode`
  String get autoModeActive {
    return Intl.message(
      'Active Mode',
      name: 'autoModeActive',
      desc: '',
      args: [],
    );
  }

  /// `Standby Mode`
  String get autoModeStandby {
    return Intl.message(
      'Standby Mode',
      name: 'autoModeStandby',
      desc: '',
      args: [],
    );
  }

  /// `Operating Mode`
  String get homeTitle {
    return Intl.message(
      'Operating Mode',
      name: 'homeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Manual Mode`
  String get homeManualMode {
    return Intl.message(
      'Manual Mode',
      name: 'homeManualMode',
      desc: '',
      args: [],
    );
  }

  /// `Automatic Mode`
  String get homeAutoMode {
    return Intl.message(
      'Automatic Mode',
      name: 'homeAutoMode',
      desc: '',
      args: [],
    );
  }

  /// `Manual Mode`
  String get manualModeTitle {
    return Intl.message(
      'Manual Mode',
      name: 'manualModeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Temp: {value} {unit}`
  String chartTemperatureTooltip(Object value, Object unit) {
    return Intl.message(
      'Temp: $value $unit',
      name: 'chartTemperatureTooltip',
      desc: '',
      args: [value, unit],
    );
  }

  /// `Hum: {value} %`
  String chartHumidityTooltip(Object value) {
    return Intl.message(
      'Hum: $value %',
      name: 'chartHumidityTooltip',
      desc: '',
      args: [value],
    );
  }

  /// `Temperature (°C)`
  String get formTemperatureLabel {
    return Intl.message(
      'Temperature (°C)',
      name: 'formTemperatureLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter a temperature`
  String get formTemperatureEmpty {
    return Intl.message(
      'Enter a temperature',
      name: 'formTemperatureEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Humidity (%)`
  String get formHumidityLabel {
    return Intl.message(
      'Humidity (%)',
      name: 'formHumidityLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter a humidity value`
  String get formHumidityEmpty {
    return Intl.message(
      'Enter a humidity value',
      name: 'formHumidityEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Invalid value`
  String get formInvalidValue {
    return Intl.message(
      'Invalid value',
      name: 'formInvalidValue',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get formAddButton {
    return Intl.message(
      'Add',
      name: 'formAddButton',
      desc: '',
      args: [],
    );
  }

  /// `Temperature Sensor`
  String get sensorTemperature {
    return Intl.message(
      'Temperature Sensor',
      name: 'sensorTemperature',
      desc: '',
      args: [],
    );
  }

  /// `Humidity Sensor`
  String get sensorHumidity {
    return Intl.message(
      'Humidity Sensor',
      name: 'sensorHumidity',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get filterAll {
    return Intl.message(
      'All',
      name: 'filterAll',
      desc: '',
      args: [],
    );
  }

  /// `Temperature`
  String get filterTemperature {
    return Intl.message(
      'Temperature',
      name: 'filterTemperature',
      desc: '',
      args: [],
    );
  }

  /// `Humidity`
  String get filterHumidity {
    return Intl.message(
      'Humidity',
      name: 'filterHumidity',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppLocalizations {
  final Locale locale;
  late Map<String, dynamic> _strings;
  AppLocalizations(this.locale);

  static const supportedLocales = <Locale>[
    Locale('en'), Locale('bg'), Locale('es'), Locale('de'), Locale('fr'), Locale('it'), Locale('ru')
  ];

  static const localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    _AppLocalizationsDelegate(),
  ];

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  Future<bool> load() async {
    final lang = locale.languageCode;
    final data = await rootBundle.loadString('assets/locales/$lang.json');
    _strings = json.decode(data)['strings'] as Map<String, dynamic>;
    return true;
  }

  String t(String key) => _strings[key] ?? key;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();
  @override
  bool isSupported(Locale locale) => ['en','bg','es','de','fr','it','ru'].contains(locale.languageCode);
  @override
  Future<AppLocalizations> load(Locale locale) async { final loc = AppLocalizations(locale); await loc.load(); return loc; }
  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) => false;
}

import 'package:flutter/material.dart';
import '../../core/i18n/app_localizations.dart';
import '../modules/health/health_screen.dart';
import '../modules/motivation/motivation_screen.dart';
import '../modules/horoscope/horoscope_screen.dart';
import '../settings/settings_screen.dart';
class HomeScreen extends StatefulWidget {
  final void Function(Locale) onChangeLocale;
  const HomeScreen({super.key, required this.onChangeLocale});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context).t;
    final pages = [const HealthScreen(), const MotivationScreen(), const HoroscopeScreen(), SettingsScreen(onChangeLocale: widget.onChangeLocale)];
    final items = [
      BottomNavigationBarItem(icon: const Icon(Icons.favorite), label: t('module_health')),
      BottomNavigationBarItem(icon: const Icon(Icons.flash_on), label: t('module_motivation')),
      BottomNavigationBarItem(icon: const Icon(Icons.star), label: t('module_horoscope')),
      BottomNavigationBarItem(icon: const Icon(Icons.settings), label: t('menu_settings')),
    ];
    return Scaffold(
      appBar: AppBar(title: Text(t('app_name'))),
      body: pages[_index],
      bottomNavigationBar: BottomNavigationBar(currentIndex: _index, onTap: (i) => setState(() => _index = i), items: items, type: BottomNavigationBarType.fixed),
    );
  }
}

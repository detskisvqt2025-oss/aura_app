import 'package:flutter/material.dart';
import '../../../core/i18n/app_localizations.dart';
class HealthScreen extends StatelessWidget {
  const HealthScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context).t;
    return ListView(padding: const EdgeInsets.all(16), children: [
      Text(t('module_health'), style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
      const SizedBox(height: 12),
      Card(child: ListTile(title: Text(t('daily_tip')), subtitle: const Text('...'))),
      const SizedBox(height: 8),
      Card(child: ListTile(title: Text(t('today_focus')), subtitle: const Text('...'))),
    ]);
  }
}

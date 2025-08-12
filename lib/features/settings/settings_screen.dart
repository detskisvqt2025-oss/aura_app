import 'package:flutter/material.dart';
import '../../core/i18n/app_localizations.dart';
class SettingsScreen extends StatelessWidget {
  final void Function(Locale) onChangeLocale;
  const SettingsScreen({super.key, required this.onChangeLocale});
  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context).t;
    final locales = const [Locale('en'), Locale('bg'), Locale('es'), Locale('de'), Locale('fr'), Locale('it'), Locale('ru')];
    return ListView(padding: const EdgeInsets.all(16), children: [
      Text(t('menu_settings'), style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      const SizedBox(height: 12),
      Card(child: ListTile(title: Text(t('settings_language')), subtitle: const Text('en, bg, es, de, fr, it, ru'), trailing: const Icon(Icons.chevron_right), onTap: () async {
        final selected = await showDialog<Locale>(context: context, builder: (ctx) => SimpleDialog(title: Text(t('settings_language')), children: locales.map((loc) => SimpleDialogOption(onPressed: () => Navigator.pop(ctx, loc), child: Text(loc.languageCode.toUpperCase()))).toList()));
        if (selected != null) onChangeLocale(selected);
      })),
      const SizedBox(height: 8),
      Card(child: ListTile(title: Text(t('settings_privacy')))),
      Card(child: ListTile(title: Text(t('settings_terms')))),
    ]);
  }
}

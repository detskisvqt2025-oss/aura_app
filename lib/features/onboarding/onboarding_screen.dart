import 'package:flutter/material.dart';
import '../../core/i18n/app_localizations.dart';
class OnboardingScreen extends StatelessWidget {
  final VoidCallback onFinished;
  const OnboardingScreen({super.key, required this.onFinished});
  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context).t;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF6C5CE7), Color(0xFFA66BFF)], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: SafeArea(child: Padding(padding: const EdgeInsets.all(24.0), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Spacer(),
          Text(t('app_name'), style: const TextStyle(fontSize: 34, fontWeight: FontWeight.w700, color: Colors.white)),
          const SizedBox(height: 8),
          Text(t('tagline'), style: const TextStyle(fontSize: 16, color: Colors.white70)),
          const Spacer(),
          ElevatedButton(onPressed: onFinished, child: Text(t('cta_get_started'))),
        ]))),
      ),
    );
  }
}

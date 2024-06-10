import 'package:airflower/components/settings/_settings.dart';
import 'package:airflower/data/providers.dart';
import 'package:flutter/material.dart';

class SettingsPreset extends StatelessWidget {
  const SettingsPreset({super.key});

  @override
  Widget build(BuildContext context) {
    return const Settings(
      mode: Mode.ai,
      child: Column(
        children: [
          Text('Preset!')
        ],
      ),
    );
  }
}

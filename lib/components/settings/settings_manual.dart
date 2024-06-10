import 'package:airflower/components/settings/_settings.dart';
import 'package:airflower/data/providers.dart';
import 'package:flutter/material.dart';

class SettingsManual extends StatelessWidget {
  const SettingsManual({super.key});

  @override
  Widget build(BuildContext context) {
    return const Settings(
      mode: Mode.ai,
      child: Column(
        children: [
          Text('manual!')
        ],
      ),
    );
  }
}

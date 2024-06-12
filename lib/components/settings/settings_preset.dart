import 'package:airflower/components/settings/_settings.dart';
import 'package:airflower/data/hive_constants.dart';
import 'package:airflower/data/providers.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PresetButton extends StatelessWidget {
  const PresetButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      child: const Text('asdads'),
    );
  }
}

class SettingsPreset extends StatelessWidget {
  const SettingsPreset({super.key});

  @override
  Widget build(BuildContext context) {
    final Box b = Hive.box(BOX_PRESET);
    final m = b.toMap();
    final l = m.keys.toList();

    return Settings(
      mode: Mode.preset,
      child: ListView.builder(
        itemCount: l.length,
        itemBuilder: (_, index) {
          return Text(l[index]);
        },
      ),
    );
  }
}

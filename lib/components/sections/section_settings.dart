import 'package:airflower/components/settings/settings_ai.dart';
import 'package:airflower/components/settings/settings_manual.dart';
import 'package:airflower/components/settings/settings_none.dart';
import 'package:airflower/components/settings/settings_preset.dart';
import 'package:airflower/data/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SectionSettings extends ConsumerWidget {
  const SectionSettings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final m = ref.watch(modeProvider);

    late Widget w;
    switch (m) {
      case Mode.ai:
        w = const SettingsAI();
      case Mode.manual:
        w = const SettingsManual();
      case Mode.sleep:
        w = const SettingsNone();
      case Mode.preset:
        w = const SettingsPreset();
    }

    return Container(
      padding: const EdgeInsets.all(50),
      child: w,
    );
  }
}

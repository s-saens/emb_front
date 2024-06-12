import 'package:airflower/components/mode_buttons/mode_button_ai.dart';
import 'package:airflower/components/mode_buttons/mode_button_manual.dart';
import 'package:airflower/components/mode_buttons/mode_button_none.dart';
import 'package:airflower/components/mode_buttons/mode_button_preset.dart';
import 'package:airflower/data/hive_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SectionModeButtons extends ConsumerWidget {
  const SectionModeButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final box = Hive.box(BOX_PRESET);

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ModeButtonNone(),
          const ModeButtonAI(),
          const ModeButtonManual(),
          ValueListenableBuilder(
            valueListenable: box.listenable(),
            builder: (context, box, _) {
              return Visibility(
                visible: box.isNotEmpty,
                child: const ModeButtonPreset(),
              );
            },
          ),
        ],
      ),
    );
  }
}

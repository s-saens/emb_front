import 'package:airflower/components/mode_buttons/mode_button_ai.dart';
import 'package:airflower/components/mode_buttons/mode_button_manual.dart';
import 'package:airflower/components/mode_buttons/mode_button_none.dart';
import 'package:airflower/components/mode_buttons/mode_button_preset.dart';
import 'package:flutter/material.dart';

class SectionModeButtons extends StatelessWidget {
  const SectionModeButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ModeButtonNone(),
          ModeButtonAI(),
          ModeButtonPreset(),
          ModeButtonManual(),
        ],
      ),
    );
  }
}

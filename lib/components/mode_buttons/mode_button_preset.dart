import 'package:airflower/components/mode_buttons/mode_button.dart';
import 'package:airflower/data/providers.dart';
import 'package:flutter/material.dart';

class ModeButtonPreset extends StatelessWidget {
  const ModeButtonPreset({super.key});
  @override
  Widget build(BuildContext context) {
    return const ModeButton(
      mode: Mode.preset,
      open: SizedBox(
        height: 0,
      ),
    );
  }
}

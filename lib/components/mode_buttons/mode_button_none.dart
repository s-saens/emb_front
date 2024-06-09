import 'package:airflower/components/mode_buttons/mode_button.dart';
import 'package:airflower/data/providers.dart';
import 'package:flutter/material.dart';

class ModeButtonNone extends StatelessWidget {
  const ModeButtonNone({super.key});
  @override
  Widget build(BuildContext context) {
    return const ModeButton(
      mode: Mode.none,
      open: SizedBox(
        height: 0,
      ),
    );
  }
}

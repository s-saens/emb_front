import 'package:airflower/components/mode_buttons/mode_button.dart';
import 'package:airflower/data/providers.dart';
import 'package:flutter/material.dart';

class ModeButtonAI extends StatelessWidget {
  const ModeButtonAI({super.key});
  @override
  Widget build(BuildContext context) {
    return const ModeButton(
      mode: Mode.ai,
      open: SizedBox(
        height: 300,
        child: Column(
          children: [
            SizedBox(
              height: 300,
            )
          ],
        ),
      ),
    );
  }
}

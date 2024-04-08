import 'package:airflower/data/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ModeButton extends ConsumerWidget {
  final Mode? mode;

  const ModeButton({super.key, required this.mode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentMode = ref.watch(modeProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final textColor = currentMode == mode ? colorScheme.primary : colorScheme.background;
    final bgColor = currentMode == mode ? colorScheme.background : colorScheme.primary;
    final borderColor = colorScheme.primary;

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(color: borderColor),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Text(
        "mode",
        style: TextStyle(
          color: textColor,
        ),
      ),
    );
  }
}

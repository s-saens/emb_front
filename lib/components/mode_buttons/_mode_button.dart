import 'package:airflower/data/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ModeButton extends ConsumerWidget {
  final Mode mode;
  final Widget open;

  const ModeButton({
    super.key,
    required this.mode,
    required this.open,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMode = ref.watch(modeProvider);
    final isSelected = mode == selectedMode;
    final modeString = mode.toString().split('.')[1].toUpperCase();

    final colorScheme = Theme.of(context).colorScheme;
    final textColor = isSelected ? colorScheme.background : colorScheme.primary;
    final bgColor = isSelected ? colorScheme.primary : colorScheme.background;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child: MaterialButton(
          height: 50,
          padding: const EdgeInsets.all(10),
          onPressed: () {
            if (!isSelected) ref.read(modeProvider.notifier).state = mode;
          },
          textColor: textColor,
          color: bgColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(modeString),
            ],
          ),
        ),
      ),
    );
  }
}

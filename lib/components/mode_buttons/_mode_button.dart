import 'package:airflower/components/http_controller.dart';
import 'package:airflower/data/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ModeButton extends ConsumerWidget {
  final Mode mode;
  final Widget open;
  final bool enabled;

  const ModeButton({
    super.key,
    required this.mode,
    required this.open,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMode = ref.watch(modeProvider);
    final isSelected = mode == selectedMode;
    final modeString = mode.toString().split('.')[1].toUpperCase();

    final colorScheme = Theme.of(context).colorScheme;
    final textColor = isSelected ? colorScheme.background : Colors.white;
    final bgColor = isSelected ? Colors.white : colorScheme.background;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child: MaterialButton(
          height: 50,
          padding: const EdgeInsets.all(10),
          onPressed: () {
            if (!isSelected) {
              ref.read(modeProvider.notifier).state = mode;
              setMode(mode);
            }
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

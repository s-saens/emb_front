import 'package:airflower/components/settings/settings_preset.dart';
import 'package:airflower/data/p_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TypeSelector extends StatelessWidget {
  const TypeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: SizedBox(
        width: 250,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TypeButton(type: Type.cool),
                TypeButton(type: Type.warm),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TypeButton(type: Type.dehumid),
                TypeButton(type: Type.auto),
                TypeButton(type: Type.normal_wind),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TypeButton extends ConsumerWidget {
  final Type type;

  const TypeButton({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final icon = modeIcons[type.index];
    final selectedType = ref.watch(settingTypeProvider);
    final isSelected = type == selectedType;

    final colorScheme = Theme.of(context).colorScheme;
    final iconColor = isSelected ? colorScheme.background : Colors.white;
    final bgColor = isSelected ? Colors.white : Colors.transparent;

    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        color: bgColor,
      ),
      child: IconButton(
        onPressed: () {
          ref.read(settingTypeProvider.notifier).state = type;
        },
        icon: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}

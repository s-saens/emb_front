import 'package:airflower/data/p_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TypeSelector extends StatelessWidget {
  const TypeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: SizedBox(
          width: 250,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TypeButton(type: Type.cool, icon: Icons.ac_unit_outlined),
                  TypeButton(type: Type.warm, icon: Icons.whatshot_outlined),
                  TypeButton(type: Type.normal_wind, icon: Icons.air),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TypeButton(type: Type.dehumid, icon: Icons.water_drop_rounded),
                  TypeButton(type: Type.auto, icon: Icons.thermostat_auto_outlined),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TypeButton extends ConsumerWidget {
  final Type type;
  final IconData icon;

  const TypeButton({
    super.key,
    required this.type,
    required this.icon,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

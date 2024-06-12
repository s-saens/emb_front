import 'package:airflower/data/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SectionCurrentCondition extends ConsumerWidget {
  const SectionCurrentCondition({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Condition c = ref.watch(conditionProvider);

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConditionItem("TEMPERATURE", "${c.temp}°C"),
          ConditionItem("H  U  M  I  D", '${c.humid.toString()}%'),
        ],
      ),
    );
  }
}

class ConditionItem extends ConsumerWidget {
  final String text;
  final String value;

  const ConditionItem(this.text, this.value, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 100,
      width: 150,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Text(text),
          ),
          Expanded(
            flex: 2,
            child: Text(
              value,
              style: const TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}

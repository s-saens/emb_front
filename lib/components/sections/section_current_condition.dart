import 'package:airflower/data/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SectionCurrentCondition extends ConsumerWidget {
  const SectionCurrentCondition({super.key});

  String _getTempText(TempMode m, double t) {
    switch (m) {
      case TempMode.celsius:
        return '${t.toString()} °C';
      case TempMode.fahrenheit:
        return '${t.toString()} °F';
      default:
        return 'ERROR';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Condition c = ref.watch(conditionProvider);
    final TempMode tempMode = ref.watch(tempModeProvider);

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConditionItem("TEMPERATURE", _getTempText(tempMode, c.temp)),
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
      width: 200,
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

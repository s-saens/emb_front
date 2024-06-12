import 'package:airflower/components/settings/_settings.dart';
import 'package:airflower/components/start_button.dart';
import 'package:airflower/data/hive_constants.dart';
import 'package:airflower/data/providers.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PresetButton extends StatelessWidget {
  const PresetButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      child: const Text('asdads'),
    );
  }
}

class SettingsPreset extends StatelessWidget {
  const SettingsPreset({super.key});

  @override
  Widget build(BuildContext context) {

    return ValueListenableBuilder(
        valueListenable: Hive.box(BOX_PRESET).listenable(),
        builder: (_, Box b, __) {
          final m = b.toMap();
          final l = m.keys.toList();
          return Settings(
            mode: Mode.preset,
            child: ListView.builder(
              itemCount: l.length,
              itemBuilder: (_, index) {
                return PresetCard(l[index]);
              },
            ),
          );
        });
  }
}

const List<IconData> modeIcons = [
  Icons.ac_unit_outlined,
  Icons.whatshot_outlined,
  Icons.water_drop_rounded,
  Icons.thermostat_auto_outlined,
  Icons.air,
];

class PresetCard extends StatelessWidget {
  final String name;

  const PresetCard(this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    // 문자열을 '|' 구분자로 나눕니다.
    List<String> parts = name.split('|');

    // 각 부분을 정수로 변환합니다.
    List<int> data = parts.map((part) => int.parse(part)).toList();

    return Card(
      child: SizedBox(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                Hive.box(BOX_PRESET).delete(name);
              },
              icon: const Icon(Icons.delete),
            ),
            Row(
              children: [
                const Icon(Icons.thermostat),
                Text("${data[0]}°C"),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.air),
                Text("${data[1]}"),
              ],
            ),
            Icon(modeIcons[data[2]]),
            Row(
              children: [
                const Icon(Icons.timer),
                Text("${data[3]}minutes"),
              ],
            ),
            const StartButton(),
          ],
        ),
      ),
    );
  }
}

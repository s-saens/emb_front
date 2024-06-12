import 'package:flutter/material.dart';

class PresetCard extends StatelessWidget {
  final String name;

  const PresetCard({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    // 문자열을 '|' 구분자로 나눕니다.
    List<String> parts = name.split('|');

    // 각 부분을 정수로 변환합니다.
    List<int> data = parts.map((part) => int.parse(part)).toList();

    return Card(
      child: Row(
        children: [
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
          const Row(
            children: [],
          ),
          Row(
            children: [
              const Icon(Icons.timer),
              Text("${data[0]}minutes"),
            ],
          ),
        ],
      ),
    );
  }
}

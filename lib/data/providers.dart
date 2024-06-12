import 'package:flutter_riverpod/flutter_riverpod.dart';

class Condition {
  final double temp;
  final double humid;

  const Condition(
    this.temp,
    this.humid,
  );
}

enum TempMode {
  celsius,
  fahrenheit,
}

enum Mode {
  sleep,
  ai,
  preset,
  manual,
}
final modeProvider = StateProvider((ref) => Mode.manual); // 설정 모드
final conditionProvider = StateProvider((ref) => const Condition(24, 71)); // 현재 온도 및 습도


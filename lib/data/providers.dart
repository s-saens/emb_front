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
  none,
  ai,
  preset,
  manual,
}

final tempModeProvider = StateProvider((ref) => TempMode.celsius);
final modeProvider = StateProvider((ref) => Mode.manual);
final conditionProvider = StateProvider((ref) => const Condition(27, 15));

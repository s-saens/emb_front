// Manual Settings
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Type {
  cool,
  warm,
  dehumid,
  auto,
  normal_wind,
}

class SettingProvider extends StateNotifier<int> {
  final int min;
  final int max;

  SettingProvider(super.state, {this.min = 0, this.max = 40});

  int get value => state;

  increase(int amount) {
    int changedValue = state + amount;
    if (changedValue <= max && changedValue >= min) state += amount;
  }
}

typedef SNP = StateNotifierProvider<SettingProvider, int>;

final settingTempProvider = SNP((ref) => SettingProvider(20, min: 15));
final settingWindProvider = SNP((ref) => SettingProvider(2, max: 4));

final settingTypeProvider = StateProvider((ref) => Type.cool);
final settingTimerProvider = StateProvider((ref) => 0);

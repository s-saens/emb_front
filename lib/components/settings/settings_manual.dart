import 'package:airflower/components/settings/_settings.dart';
import 'package:airflower/components/settings/type_selector.dart';
import 'package:airflower/data/hive_constants.dart';
import 'package:airflower/data/p_settings.dart';
import 'package:airflower/data/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsManual extends StatelessWidget {
  const SettingsManual({super.key});

  @override
  Widget build(BuildContext context) {
    final presetBox = Hive.box(BOX_PRESET);

    return Settings(
      mode: Mode.manual,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SettingController(
                icon: Icons.thermostat,
                provider: settingTempProvider,
                suffix: " °C",
              ),
              const SizedBox(width: 30),
              SettingController(
                icon: Icons.air,
                provider: settingWindProvider,
              ),
            ],
          ),
          const SizedBox(height: 30),
          const TypeSelector(),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.timer),
              const SizedBox(width: 10),
              SizedBox(
                height: 50,
                width: 70,
                child: Consumer(
                  builder: (_, WidgetRef ref, __) {
                    final timer = ref.read(settingTimerProvider);
                    final minutesInputController = TextEditingController(text: "$timer");

                    updateProvider(String v) {
                      ref.read(settingTimerProvider.notifier).state = int.tryParse(v) ?? 0;
                    }

                    return TextField(
                      controller: minutesInputController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      onSubmitted: updateProvider,
                      onEditingComplete: () => updateProvider(minutesInputController.text),
                      onTapOutside: (_) => updateProvider(minutesInputController.text),
                    );
                  },
                ),
              ),
              const Text(' minutes later'),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer(builder: (context, ref, child) {
                int temp = ref.watch(settingTempProvider);
                int type = ref.watch(settingTypeProvider).index;
                int timer = ref.watch(settingTimerProvider);
                int wind = ref.watch(settingWindProvider);
                return IconButton(
                  onPressed: () => presetBox.put("$temp|$wind|$type|$timer", 0),
                  icon: const Icon(Icons.save),
                );
              }),
              const SizedBox(
                width: 30,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.send),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SettingController extends ConsumerWidget {
  final SNP provider;
  final IconData icon;
  final String prefix;
  final String suffix;

  const SettingController({
    super.key,
    required this.provider,
    required this.icon,
    this.prefix = "",
    this.suffix = "",
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int value = ref.watch(provider);
    return Card(
      shadowColor: Colors.black,
      child: SizedBox(
        width: 125,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_drop_up_rounded),
              onPressed: () => ref.read(provider.notifier).increase(1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon),
                const SizedBox(width: 10),
                Text('$prefix$value$suffix'),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.arrow_drop_down_rounded),
              onPressed: () => ref.read(provider.notifier).increase(-1),
            ),
          ],
        ),
      ),
    );
  }
}

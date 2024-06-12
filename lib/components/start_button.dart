import 'package:airflower/components/http_controller.dart';
import 'package:airflower/data/p_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StartButton extends ConsumerWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int tempIndex = ref.watch(settingTempProvider) - 16;
    Type type = ref.watch(settingTypeProvider);
    int timer = ref.watch(settingTimerProvider);

    int code;

    if (type == Type.normal_wind) {
      code = 68;
    } else {
      code = type.index * 17 + tempIndex;
    }

    print(code);
    return IconButton(
      onPressed: () {
        sendCode(code, timer);
      },
      icon: const Icon(
        Icons.send,
      ),
    );
  }
}

import 'package:airflower/data/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const height = 500.0;

class Settings extends ConsumerWidget {
  final Mode mode;
  final Widget child;

  const Settings({
    super.key,
    required this.mode,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const dur = Duration(milliseconds: 300);

    return Animate(
      effects: const [
        FadeEffect(duration: dur),
        SlideEffect(duration: dur, begin: Offset(0, 0.01)),
      ],
      child: Expanded(
        flex: 4,
        child: child,
      ),
    );
  }
}

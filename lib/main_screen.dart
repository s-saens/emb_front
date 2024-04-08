import 'package:airflower/components/current_condition.dart';
import 'package:airflower/components/mode_button.dart';
import 'package:airflower/data/providers.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                CurrentCondition(),
                ModeButton(mode: Mode.none),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:airflower/components/current_condition.dart';
import 'package:airflower/components/mode_buttons/a_mode_buttons.dart';
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
                ModeButtons()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:airflower/components/sections/section_current_condition.dart';
import 'package:airflower/components/sections/section_mode_buttons.dart';
import 'package:airflower/components/sections/section_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(50),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 100),
                Expanded(flex: 3, child: SectionCurrentCondition()),
                Expanded(
                  flex: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(flex: 1, child: SectionModeButtons()),
                      Expanded(flex: 10, child: SectionSettings()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
          padding: EdgeInsets.symmetric(vertical: 100, horizontal: 50),
          child: Center(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: SectionCurrentCondition(),
                ),
                Expanded(
                  flex: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: SectionSettings()),
                      SizedBox(
                        height: 50,
                        child: SectionModeButtons(),
                      ),
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

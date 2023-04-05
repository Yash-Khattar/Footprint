import 'package:flutter/material.dart';
import 'package:footprint/const.dart';
import 'package:footprint/providers/pedometer_provider.dart';
import 'package:footprint/reusable_widgets/button.dart';
import 'package:footprint/screens/auth_screen.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  static String id = 'welcome_screen';
  @override
  Widget build(BuildContext context) {
    return Consumer<PedometerProvider>(
      builder: (context, PedometerModel, child) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/welcomeScreen_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 50),
                    child: PrimaryButton(
                      color: kgreyColor,
                      text: "Continue",
                      onpressed: () {
                        PedometerModel.getPermission();
                        Navigator.pushNamed(context, AuthPage.id);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:green_saudi_app/utils/colors.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: green2,
      body:  SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.asset("assets/images/splash_logo.png"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

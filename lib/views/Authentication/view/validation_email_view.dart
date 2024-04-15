import 'package:flutter/material.dart';
import 'package:green_saudi_app/extensions/screen_handler.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';
import 'package:green_saudi_app/views/Authentication/widget/custom_button.dart';
import 'package:green_saudi_app/views/Authentication/widget/input_text_felid.dart';

class ValidationEmailView extends StatelessWidget {
  const ValidationEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        actionsIconTheme: IconThemeData(color: white),
      ),
      backgroundColor: green,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Container(
                  width: context.getWidth(),
                  height: context.getHeight() * 0.5,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/secure_login.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                height8,
                Text(
                  "تحقق من بريدك الإلكتروني واتبع الخطوات المطلوبة",
                  style: TextStyle(
                      color: white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                height10,
                const InputTextFelid(
                  title: "البريد الإلكتروني",
                  icon: Icons.email,
                  isPassword: false,
                ),
                height32,
                CustomButton(
                  title: "تحقق",
                  backgroundColor: greenLight2,
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

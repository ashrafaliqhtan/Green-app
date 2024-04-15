import 'package:flutter/material.dart';
import 'package:green_saudi_app/extensions/screen_handler.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';
import 'package:green_saudi_app/views/validation_email_view.dart';
import 'package:green_saudi_app/widgets/custom_button.dart';

import '../widgets/input_text_felid.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/background_img_1.png",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          width: context.getWidth() * 0.80,
          height: context.getHeight() * 0.50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.6),
                Colors.black.withOpacity(0.21)
              ],
            ),
          ),
          child: Column(
            children: [
              Text(
                "مرحبا بك",
                style: TextStyle(
                    color: white, fontWeight: FontWeight.bold, fontSize: 48),
              ),
              const InputTextFelid(
                title: "البريد الإلكتروني",
                icon: Icons.email,
                isPassword: false,
              ),
              const InputTextFelid(
                title: "كلمة المرور",
                icon: Icons.lock,
                isPassword: true,
              ),
              height8,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  width30,
                  InkWell(
                    onTap: () {
                      context.push(view: ValidationEmailView(), isPush: true);
                    },
                    child: Text(
                      "هل نسيت كلمة المرور ؟",
                      style: TextStyle(
                        color: white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              height26,
              CustomButton(
                title: "تسجيل الدخول",
                onPressed: () {},
                backgroundColor: green,
              )
            ],
          ),
        ),
      ),
    ));
  }
}


import 'package:flutter/material.dart';
import 'package:green_saudi_app/extensions/screen_handler.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';
import 'package:green_saudi_app/views/Authentication/widget/custom_button.dart';
import 'package:green_saudi_app/views/Authentication/widget/input_text_felid.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController conformPasswordController = TextEditingController();
  @override
  void dispose() {
    passwordController.dispose();
    conformPasswordController.dispose();
    super.dispose();
  }

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
          child: Column(
            children: [
              Container(
                width: context.getWidth(),
                height: context.getHeight() * 0.45,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/reset_password.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              height10,
              InputTextFelid(
                controller: passwordController,
                title: "كلمة المرور الجديده",
                icon: Icons.lock,
                isPassword: true,
              ),
              InputTextFelid(
                controller: conformPasswordController,
                title: "تأكيد كلمة المرور",
                icon: Icons.lock,
                isPassword: true,
              ),
              height32,
              CustomButton(
                title: "تأكيد",
                backgroundColor: greenLight2,
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

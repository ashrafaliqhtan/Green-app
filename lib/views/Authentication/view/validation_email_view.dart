import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:green_saudi_app/extensions/screen_handler.dart';
import 'package:green_saudi_app/localistion/localistion.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';
import 'package:green_saudi_app/views/Authentication/widget/custom_button.dart';
import 'package:green_saudi_app/views/Authentication/widget/input_text_felid.dart';

class ValidationEmailView extends StatefulWidget {
  const ValidationEmailView({super.key});

  @override
  State<ValidationEmailView> createState() => _ValidationEmailViewState();
}

class _ValidationEmailViewState extends State<ValidationEmailView> {
  TextEditingController emailController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actionsIconTheme: IconThemeData(color: green),
      ),
      backgroundColor: pureWhite,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Container(
                width: context.getWidth(),
                height: context.getHeight() * 0.5,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/secure_login.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              height16,
              Text(
                AppLocale.instruction.getString(context),
                style: TextStyle(
                    color: green, fontSize: 15, fontWeight: FontWeight.bold),
              ),
              height10,
              InputTextFelid(
                controller: emailController,
                title: AppLocale.emailTitle.getString(context),
                icon: Icons.email,
                isPassword: false,
                isColorChange: true,
              ),
              height32,
              CustomButton(
                title: AppLocale.verification.getString(context),
                backgroundColor: green,
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

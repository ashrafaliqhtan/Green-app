import 'package:flutter/material.dart';
import 'package:green_saudi_app/extensions/screen_handler.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';
import 'package:green_saudi_app/views/Authentication/view/login_view.dart';
import 'package:green_saudi_app/views/Authentication/widget/custom_button.dart';
import 'package:green_saudi_app/views/Authentication/widget/input_text_felid.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conformPasswordController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    conformPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/background_img_2.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            width: context.getWidth() * 0.80,
            height: context.getHeight() * 0.90,
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
                InputTextFelid(
                  controller: nameController,
                  title: "الاسم",
                  icon: Icons.person_outline,
                  isPassword: false,
                ),
                InputTextFelid(
                  controller: emailController,
                  title: "البريد الإلكتروني",
                  icon: Icons.email,
                  isPassword: false,
                ),
                InputTextFelid(
                  controller: phoneController,
                  title: "رقم الجوال",
                  icon: Icons.phone_outlined,
                  isPassword: false,
                ),
                InputTextFelid(
                  controller: passwordController,
                  title: "كلمة المرور",
                  icon: Icons.lock,
                  isPassword: true,
                ),
                InputTextFelid(
                  controller: conformPasswordController,
                  title: "تأكيد كلمة المرور",
                  icon: Icons.lock,
                  isPassword: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    width42,
                    InkWell(
                      onTap: () {
                        context.push(view: const LoginView(), isPush: false);
                      },
                      child: Text(
                        "هل لديك حساب؟",
                        style: TextStyle(
                          color: white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                height20,
                CustomButton(
                  title: "إنشاء الحساب",
                  onPressed: () {},
                  backgroundColor: green,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

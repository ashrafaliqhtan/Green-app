import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_saudi_app/extensions/screen_handler.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';
import 'package:green_saudi_app/views/Authentication/bloc/auth_bloc.dart';
import 'package:green_saudi_app/views/Authentication/view/signup_view.dart';
import 'package:green_saudi_app/views/Authentication/view/validation_email_view.dart';
import 'package:green_saudi_app/views/Authentication/widget/custom_button.dart';
import 'package:green_saudi_app/views/bottom_nav_bar/view/bottom_nav_bar.dart';

import '../widget/input_text_felid.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<AuthBloc>();
        return Scaffold(
            body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthLoginSuccessState) {
              context.getMessagesBar(msg: state.message, color: green);
              context.push(view: BottomNavBar(), isPush: false);
            } else if (state is AuthLoginErrorState) {
              context.getMessagesBar(msg: state.message, color: red);
            }
          },
          builder: (context, state) {
            return Container(
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
                            color: white,
                            fontWeight: FontWeight.bold,
                            fontSize: 48),
                      ),
                      InputTextFelid(
                        controller: emailController,
                        title: "البريد الإلكتروني",
                        hintText: "ادخل البريد الإلكتروني",
                        icon: Icons.email,
                        isPassword: false,
                      ),
                      InputTextFelid(
                        controller: passwordController,
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
                              context.push(
                                  view: const ValidationEmailView(),
                                  isPush: true);
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
                        onPressed: () {
                          bloc.add(LoginEvent(
                              email: emailController.text,
                              password: passwordController.text));
                        },
                        backgroundColor: green,
                      ),
                      InkWell(
                        onTap: () {
                          context.push(
                              view: const SignUpView(), isPush: true);
                        },
                        child: Text(
                          "ليس لديك حساب سجل معنا",
                          style: TextStyle(
                            color: white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
      }),
    );
  }
}

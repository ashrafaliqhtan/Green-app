import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:green_saudi_app/resources/extensions/screen_handler.dart';
import 'package:green_saudi_app/resources/localization/localization.dart';
import 'package:green_saudi_app/resources/utils/colors.dart';
import 'package:green_saudi_app/resources/utils/spacing.dart';
import 'package:green_saudi_app/views/Authentication/bloc/auth_bloc.dart';
import 'package:green_saudi_app/views/Authentication/view/otp_view.dart';
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
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthCheckEmailVerificationState) {
          context.getMessagesBar(msg: state.message, color: green);
          context.push(view: OTPView(), isPush: false);
        } else if (state is AuthCheckEmailVerificationErrorState) {
          context.getMessagesBar(msg: state.message, color: red);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actionsIconTheme: IconThemeData(color: green),
          ),
          backgroundColor: pureWhite,
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
                      AppLocale.instruction.getString(context),
                      style: TextStyle(
                          color: white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    height10,
                    InputTextFelid(
                      controller: emailController,
                      title: AppLocale.emailTitle.getString(context),
                      hintText: "example@gmail.com",
                      icon: Icons.email,
                      isPassword: false,
                      isColorChange: true,
                    ),
                    height32,
                    CustomButton(
                      title: AppLocale.verification.getString(context),
                      backgroundColor: green,
                      onPressed: () {
                        context
                            .read<AuthBloc>()
                            .add(SendOtpEvent(email: emailController.text));
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_saudi_app/data_layer/data_layer.dart';
import 'package:green_saudi_app/extensions/screen_handler.dart';
import 'package:green_saudi_app/service/supabase_services.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:green_saudi_app/views/Authentication/bloc/auth_bloc.dart';
import 'package:green_saudi_app/views/Authentication/view/reset_password_view.dart';
import 'package:timer_count_down/timer_count_down.dart';

// ignore: must_be_immutable
class OTPView extends StatelessWidget {
  OTPView({super.key});
  bool isButtonEnabled = false;
  @override
  Widget build(BuildContext context) {
    final serviceLocator = DataInjection().locator.get<DBServices>();
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthCheckOTPVerificationState) {
          context.push(view: const ResetPasswordView(), isPush: true);
          context.getMessagesBar(
            msg: state.message,
            color: green,
          );
        } else if (state is AuthResendOTPState) {
          context.getMessagesBar(
            msg: state.message,
            color: green,
          );
        } else if (state is AuthResendOTPErrorState) {
          context.getMessagesBar(msg: state.message, color: red);
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: white,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                height40,
                Image.asset('assets/images/Data security.png'),
                height40,
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "أدخل رمز التحقق",
                    style: TextStyle(color: green, fontSize: 25),
                  ),
                ),
                height20,
                // Custom widget
                OtpTextField(
                  numberOfFields: 6,
                  showCursor: true,
                  margin: const EdgeInsets.all(5),
                  fieldWidth: context.getWidth() * .1,
                  fieldHeight: context.getHeight() * .075,
                  borderColor: pureWhite,
                  showFieldAsBox: true,
                  fillColor: pureWhite,
                  filled: true,
                  borderRadius: BorderRadius.circular(20),
                  textStyle: TextStyle(
                      fontSize: 25, color: green, fontWeight: FontWeight.bold),
                  cursorColor: green,
                  focusedBorderColor: pureWhite,
                  // clearText: true,
                  onCodeChanged: (value) {
                    serviceLocator.otpToken = value;
                  },
                  onSubmit: (value) {
                    serviceLocator.otpToken = value;
                  },
                ),
                height20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: isButtonEnabled
                          ? () {
                              context.read<AuthBloc>().add(
                                  ResendOtpEvent(email: serviceLocator.email));
                            }
                          : null,
                      child: Text(
                        'أعد الارسال',
                        style: TextStyle(
                          fontSize: 18,
                          color: green,
                        ),
                      ),
                    ),
                    Countdown(
                      seconds: 60,
                      build: (BuildContext context, double time) => Text(
                        'إعادة رمز التحقق بعد ${time.toInt()} ثانية',
                        style: TextStyle(fontSize: 18, color: green),
                      ),
                      interval: const Duration(seconds: 1),
                      onFinished: () {
                        (context as Element).markNeedsBuild();
                        isButtonEnabled = true;
                      },
                    ),
                  ],
                ),
                height40,
                ElevatedButton(
                  onPressed: () {
                    print("=========================");
                    print(serviceLocator.otpToken);
                    print("=========================");
                    context
                        .read<AuthBloc>()
                        .add(VerifyOtpEvent(otpToken: serviceLocator.otpToken));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: greenDark,
                      minimumSize: Size(context.getWidth(), 50)),
                  child: const Text(
                    'تحقق',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_saudi_app/resources/extensions/screen_handler.dart';
import 'package:green_saudi_app/resources/localization/localization.dart';
import 'package:green_saudi_app/resources/utils/colors.dart';
import 'package:green_saudi_app/resources/utils/spacing.dart';
import 'package:green_saudi_app/views/Authentication/bloc/auth_bloc.dart';
import 'package:green_saudi_app/views/Authentication/view/login_view.dart';
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
          context.push(view: OTPView(), isPush: true);
        } else if (state is AuthCheckEmailVerificationErrorState) {
          context.getMessagesBar(msg: state.message, color: red, success: false);
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(onPressed: (){context.push(view: const LoginView(), isPush: false);}, icon:  Icon(Icons.arrow_back,color: green,)),
              backgroundColor: Colors.transparent,
            ),
            backgroundColor: pureWhite,
            body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      SizedBox(
                        width: context.getWidth(),
                        height: context.getHeight() * 0.5,
                        child: 
                          SvgPicture.asset("assets/icons/Security On-rafiki.svg"),
                        
                      ),
                      height8,
                      Text(
                        AppLocale.instruction.getString(context),
                        style: TextStyle(
                            color: green,
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
          ),
        );
      },
    );
  }
}

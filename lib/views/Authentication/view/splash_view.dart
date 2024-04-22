import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_saudi_app/resources/extensions/screen_handler.dart';
import 'package:green_saudi_app/resources/utils/colors.dart';
import 'package:green_saudi_app/views/Authentication/bloc/auth_bloc.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SessionAvailabilityState) {
          context.push(view: state.page, isPush: false);
          
        }
      },
      child: Scaffold(
        backgroundColor: green,
        body: SafeArea(
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
      ),
    );
  }
}

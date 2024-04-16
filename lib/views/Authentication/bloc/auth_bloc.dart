import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_saudi_app/data_layer/data_layer.dart';
import 'package:green_saudi_app/model/onboarding_model.dart';
import 'package:green_saudi_app/service/supabase_services.dart';
import 'package:green_saudi_app/views/Admin/view/control_panel.dart';
import 'package:green_saudi_app/views/bottom_nav_bar/view/bottom_nav_bar.dart';
import 'package:green_saudi_app/views/onboarding/view/onboarding_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final serviceLocator = DataInjection().locator.get<DBServices>();

  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});
    on<SignUpEvent>(signUpNewUser);
    on<LoginEvent>(login);
    on<CheckSessionAvailability>(getSession);
    on<LogoutEvent>(logout);
  }

  FutureOr<void> signUpNewUser(
      SignUpEvent event, Emitter<AuthState> emit) async {
    // Check if all required fields are not empty
    if (event.email.trim().isNotEmpty &&
        event.password.trim().isNotEmpty &&
        event.name.trim().isNotEmpty &&
        event.phone.trim().isNotEmpty) {
      if (RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
          .hasMatch(event.email)) {
        if (RegExp(r'^05[0-9]{8}$').hasMatch(event.phone)) {
          // Check if the password matches the confirmation password
          if (event.password == event.confirmPassword) {
            try {
              await serviceLocator.signUp(
                name: event.name,
                email: event.email,
                password: event.password,
                phone: event.phone,
              );
              emit(AuthSignUpSuccessState(
                  message: "تم إكمال عملية التسجيل بنجاح"));
            } on AuthException catch (e) {
              emit(AuthSignUpErrorState(
                message:
                    "فشل في عملية التسجيل: ${e.statusCode}. يرجى التحقق من بريدك الإلكتروني وكلمة المرور",
              ));
            } on Exception catch (e) {
              emit(AuthSignUpErrorState(
                  message: "حدث خطأ أثناء عملية التسجيل: $e"));
            }
          } else {
            emit(AuthSignUpErrorState(
                message: "كلمة المرور وتأكيد كلمة المرور غير متطابقين"));
          }
        } else {
          emit(AuthSignUpErrorState(
              message: "يبدو أن هناك خطأ في رقم الهاتف المُدخل"));
        }
      } else {
        emit(AuthSignUpErrorState(
            message: "برجاء التحقق من صحة البريد الإلكتروني المُدخل."));
      }
    } else {
      emit(AuthSignUpErrorState(message: "يرجى ملء جميع الحقول المطلوبة"));
    }
  }

  FutureOr<void> login(LoginEvent event, Emitter<AuthState> emit) async {
    if (event.email.trim().isNotEmpty && event.password.trim().isNotEmpty) {
      if ((RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
          .hasMatch(event.email))) {
        try {
          await serviceLocator.login(
              email: event.email, password: event.password);

          emit(AuthLoginSuccessState(message: "تم تسجيل الدخول بنجاح"));
        } on AuthException catch (e) {
          emit(AuthLoginErrorState(
              message:
                  "البريد الإلكتروني أو كلمة المرور غير صحيحة: ${e.statusCode}. يرجى التحقق من بيانات الاعتماد الخاصة بك والمحاولة مرة أخرى"));
        } on Exception catch (e) {
          emit(AuthLoginErrorState(
              message: "حدث خطأ أثناء عملية تسجيل الدخول: $e"));
        }
      } else {
        emit(AuthLoginErrorState(
            message: "برجاء التحقق من صحة البريد الإلكتروني المُدخل."));
      }
    } else {
      emit(AuthLoginErrorState(
          message: "يرجى ملء كل من حقل البريد الإلكتروني وكلمة المرور."));
    }
  }

  FutureOr<void> getSession(
      CheckSessionAvailability event, Emitter<AuthState> emit) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      final sessionData = await serviceLocator.getCurrentSession();
      if (sessionData != null) {
        final userId = await serviceLocator.getCurrentUserId();
        await serviceLocator.getUserRole(id: userId);

        if (serviceLocator.userRole == 'admin') {
          emit(SessionAvailabilityState(page: const ControlPanel()));
        } else {
          emit(SessionAvailabilityState(page: BottomNavBar()));
        }
      } else {
        emit(SessionAvailabilityState(page: const OnboardingView()));
      }
    } catch (e) {}
  }

  FutureOr<void> logout(LogoutEvent event, Emitter<AuthState> emit) async {
    try {
      await serviceLocator.signOut();
      emit(AuthLogoutSuccessState(message: "تم تسجيل الخروج بنجاح"));
    } catch (e) {
      emit(AuthLogoutErrorState(message: "حدث خطأ أثناء عملية تسجيل الخروج"));
    }
  }
}

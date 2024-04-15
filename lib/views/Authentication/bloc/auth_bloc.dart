import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_saudi_app/data_layer/data_layer.dart';
import 'package:green_saudi_app/service/supabase_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final serviceLocator = DataInjection().locator.get<DBServices>();

  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});
    on<SignUpEvent>(signUpNewUser);
  }

  FutureOr<void> signUpNewUser(
      SignUpEvent event, Emitter<AuthState> emit) async {
    // Check if all required fields are not empty
    if (event.email.trim().isNotEmpty &&
        event.password.trim().isNotEmpty &&
        event.name.trim().isNotEmpty &&
        event.phone.trim().isNotEmpty) {
      // Check if the password matches the confirmation password
      if (event.password == event.confirmPassword) {
        try {
          await serviceLocator.signUp(
            name: event.name,
            email: event.email,
            password: event.password,
            phone: event.phone,
          );
          emit(AuthSignUpSuccessState(message: "تم إكمال عملية التسجيل بنجاح"));
        } on AuthException catch (e) {
          emit(AuthSignUpErrorState(
              message:
                  "فشل في عملية التسجيل: ${e.statusCode}. يرجى التحقق من بريدك الإلكتروني وكلمة المرور"));
        } on Exception catch (e) {
          emit(
              AuthSignUpErrorState(message: "حدث خطأ أثناء عملية التسجيل: $e"));
        }
      } else {
        emit(AuthSignUpErrorState(
            message: "كلمة المرور وتأكيد كلمة المرور غير متطابقين"));
      }
    } else {
      emit(AuthSignUpErrorState(message: "يرجى ملء جميع الحقول المطلوبة"));
    }
  }
}

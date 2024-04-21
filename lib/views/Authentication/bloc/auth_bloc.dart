import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_saudi_app/locators/data_injection.dart';
import 'package:green_saudi_app/model/gsi_user.dart';
import 'package:green_saudi_app/service/supabase_services.dart';
import 'package:green_saudi_app/views/Admin/bottom_nav_bar_admin/view/bottom_nav_bar_admin.dart';
import 'package:green_saudi_app/views/onboarding/view/onboarding_view.dart';
import 'package:green_saudi_app/widgets/loading_widget.dart';
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
    on<SendOtpEvent>(sendOTP);
    on<VerifyOtpEvent>(verifyOTP);
    on<ResendOtpEvent>(resendOTP);
    on<ChangePasswordEvent>(updatePassword);
    on<UpdateProfileEvent>(updateProfile);
    on<LoadProfileEvent>(loadProfile);
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
                  message:
                      "تم إنشاء الحساب بنجاح، الرجاء تأكيد الحساب عبر الإيميل الخاص بك"));
            } on AuthException catch (e) {
              print(e);
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
          print("----------------");
          print(e.message);
          print(e.statusCode);
          print("----------------");
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
        serviceLocator.userID = await serviceLocator.getCurrentUserId();
        serviceLocator.user =
            await serviceLocator.getUser(id: serviceLocator.userID);
        if (serviceLocator.user.typeRole == 'admin') {
          emit(SessionAvailabilityState(page:  BottomNavBarAdmin()));
        } else {
          emit(SessionAvailabilityState(page: FutureDelayedWidget()));
        }
      } else {
        emit(SessionAvailabilityState(page: const OnboardingView()));
      }
    } catch (_) {}
  }

  FutureOr<void> logout(LogoutEvent event, Emitter<AuthState> emit) async {
    try {
      await serviceLocator.signOut();
      emit(AuthLogoutSuccessState(message: "تم تسجيل الخروج بنجاح"));
    } catch (e) {
      emit(AuthLogoutErrorState(message: "حدث خطأ أثناء عملية تسجيل الخروج"));
    }
  }

  FutureOr<void> sendOTP(SendOtpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    if (event.email.trim().isNotEmpty) {
      try {
        await serviceLocator.sendOtp(email: event.email);
        serviceLocator.email = event.email;
        emit(AuthCheckEmailVerificationState(
            message: "تم إرسال رمز التحقق إلى بريدك الإلكتروني"));
      } catch (e) {
        emit(
            AuthCheckEmailVerificationErrorState(message: "الإيميل غير معروف"));
      }
    } else {
      emit(AuthCheckEmailVerificationErrorState(
          message: "الرجاء تعبئة حقل الإيميل لتغيير كلمة المرور"));
    }
  }

  FutureOr<void> verifyOTP(
      VerifyOtpEvent event, Emitter<AuthState> emit) async {
    if (event.otpToken.trim().isNotEmpty && event.otpToken.length == 6) {
      try {
        await serviceLocator.verifyOtp(
            email: serviceLocator.email, otpToken: event.otpToken);
        emit(AuthCheckOTPVerificationState(
            message: "تم تأكيد رمز OTP، يرجى إدخال كلمة المرور الجديدة"));
      } on AuthException catch (_) {
        emit(AuthCheckOTPVerificationErrorState(
            message: "رمز OTP غير صالح، يرجى المحاولة مرة أخرى"));
      } on Exception catch (_) {
        emit(AuthCheckOTPVerificationErrorState(
            message:
                "هناك مشكلة في خوادمنا، يرجى المحاولة مرة أخرى في وقت لاحق"));
      }
    } else {
      emit(AuthCheckOTPVerificationErrorState(message: "يرجى إدخال رمز OTP"));
    }
  }

  FutureOr<void> resendOTP(
      ResendOtpEvent event, Emitter<AuthState> emit) async {
    try {
      await serviceLocator.resendOtp();
      emit(AuthResendOTPState(
          message: "تم إعادة إرسال رمز OTP إلى ${serviceLocator.email}"));
    } catch (e) {
      emit(AuthResendOTPErrorState(message: "تعذر إرسال رمز OTP..."));
    }
  }

  FutureOr<void> updatePassword(
      ChangePasswordEvent event, Emitter<AuthState> emit) async {
    if (event.password == event.password) {
      if (event.password.trim().isNotEmpty && event.password.length >= 6) {
        try {
          await serviceLocator.resetPassword(newPassword: event.password);
          emit(AuthChangePasswordState(message: "تم تغيير كلمة المرور بنجاح"));
          await serviceLocator.signOut();
        } on AuthException catch (_) {
          emit(AuthChangePasswordErrorState(
              message: "غير مسموح لك بتغيير كلمة المرور"));
        } on Exception catch (_) {
          emit(AuthChangePasswordErrorState(
              message:
                  "هناك مشكلة في خوادمنا، يرجى المحاولة مرة أخرى في وقت لاحق"));
        }
      } else {
        emit(AuthChangePasswordErrorState(
            message: "الرجاء إدخال كلمة مرور صالحة (6 أحرف على الأقل)"));
      }
    } else {
      emit(AuthChangePasswordErrorState(
          message:
              "كلمات المرور غير متطابقة. يرجى التأكد من تطابق كلمات المرور"));
    }
  }

  FutureOr<void> updateProfile(
      UpdateProfileEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());

    if (event.city.trim().isNotEmpty &&
        event.name.trim().isNotEmpty &&
        event.phone.trim().isNotEmpty) {
      try {
        await serviceLocator.updateUser(
            name: event.name, phone: event.phone, city: event.city);
        emit(AuthUpdateProfileState(message: "تم تحديث معلومتك الشخصيه"));
      } catch (e) {
        AuthUpdateProfileErrorState(
            message: "حدث خطأ في تعديل معلومتك الشخصيه");
      }
      emit(AuthChangePasswordErrorState(
          message: "يرجى ملء جميع الحقول المطلوبة"));
    }
  }

  FutureOr<void> loadProfile(
      LoadProfileEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      print(serviceLocator.userID);
      try {
        serviceLocator.userImageUrl =
            await serviceLocator.urlImage("avatar", serviceLocator.userID);
      } catch (e) {
        serviceLocator.userImageUrl = "https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/2048px-User-avatar.svg.png";
        print(e);
      }
      serviceLocator.user =
          await serviceLocator.getUser(id: serviceLocator.userID);
      emit(AuthLoadProfileState(user: serviceLocator.user));
    } catch (_) {}
  }
}

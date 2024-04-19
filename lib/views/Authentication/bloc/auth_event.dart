part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class SignUpEvent extends AuthEvent {
  final String name;
  final String email;
  final String phone;
  final String password;
  final String confirmPassword;
  SignUpEvent({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.confirmPassword,
  });
}

final class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  LoginEvent({required this.email, required this.password});
}

class CheckSessionAvailability extends AuthEvent {}

class LogoutEvent extends AuthEvent {}

final class SendOtpEvent extends AuthEvent {
  final String email;

  SendOtpEvent({required this.email});
}

final class ResendOtpEvent extends AuthEvent {
  final String email;

  ResendOtpEvent({required this.email});
}

final class VerifyOtpEvent extends AuthEvent {
  final String otpToken;

  VerifyOtpEvent({required this.otpToken});
}

final class ChangePasswordEvent extends AuthEvent {
  final String password;
  final String confirmPassword;

  ChangePasswordEvent({required this.password, required this.confirmPassword});
}

final class UpdateProfileEvent extends AuthEvent {
  final String name;
  final String phone;
  final String city;
  UpdateProfileEvent(
      {required this.city, required this.name, required this.phone});
}

final class LoadProfileEvent extends AuthEvent{}
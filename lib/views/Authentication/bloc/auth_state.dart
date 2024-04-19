part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class SessionAvailabilityState extends AuthState {
  final Widget page;
  SessionAvailabilityState({required this.page});
}

final class AuthSignUpSuccessState extends AuthState {
  final String message;
  AuthSignUpSuccessState({required this.message});
}

final class AuthSignUpErrorState extends AuthState {
  final String message;
  AuthSignUpErrorState({required this.message});
}

final class AuthCheckOTPVerificationErrorState extends AuthState {
  final String message;
  AuthCheckOTPVerificationErrorState({required this.message});
}

final class AuthResendOTPErrorState extends AuthState {
  final String message;
  AuthResendOTPErrorState({required this.message});
}

final class AuthChangePasswordErrorState extends AuthState {
  final String message;
  AuthChangePasswordErrorState({required this.message});
}

final class AuthCheckEmailVerificationErrorState extends AuthState {
  final String message;
  AuthCheckEmailVerificationErrorState({required this.message});
}

final class AuthLoginSuccessState extends AuthState {
  final String message;
  AuthLoginSuccessState({required this.message});
}

final class AuthLoginErrorState extends AuthState {
  final String message;
  AuthLoginErrorState({required this.message});
}

final class AuthLogoutSuccessState extends AuthState {
  final String message;
  AuthLogoutSuccessState({required this.message});
}

final class AuthLogoutErrorState extends AuthState {
  final String message;
  AuthLogoutErrorState({required this.message});
}

final class AuthCheckEmailVerificationState extends AuthState {
  final String message;
  AuthCheckEmailVerificationState({required this.message});
}

final class AuthSendOTPState extends AuthState {
  final String message;
  AuthSendOTPState({required this.message});
}

final class AuthResendOTPState extends AuthState {
  final String message;
  AuthResendOTPState({required this.message});
}

final class AuthCheckOTPVerificationState extends AuthState {
  final String message;
  AuthCheckOTPVerificationState({required this.message});
}

final class AuthChangePasswordState extends AuthState {
  final String message;
  AuthChangePasswordState({required this.message});
}

final class AuthUpdateProfileState extends AuthState {
  final String message;
  AuthUpdateProfileState({required this.message});
}

final class AuthUpdateProfileErrorState extends AuthState {
  final String message;
  AuthUpdateProfileErrorState({required this.message});
}
final class AuthLoadProfileState extends AuthState{
  final GSIUser user;
  AuthLoadProfileState({required this.user});
}
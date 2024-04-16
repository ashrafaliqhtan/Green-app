part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthSignUpSuccessState extends AuthState {
  final String message;
  AuthSignUpSuccessState({required this.message});
}

final class AuthSignUpErrorState extends AuthState {
  final String message;
  AuthSignUpErrorState({required this.message});
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

final class SessionAvailabilityState extends AuthState {
  final dynamic isAvailable;
  SessionAvailabilityState({required this.isAvailable});
}

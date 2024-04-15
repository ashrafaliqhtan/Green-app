part of 'onboarding_bloc.dart';

@immutable
sealed class OnboardingState {}

final class OnboardingInitial extends OnboardingState {}

class OnboardingLoadedState extends OnboardingState {
  final int currentIndex;

  OnboardingLoadedState({required this.currentIndex});
}

part of 'onboarding_bloc.dart';

@immutable
sealed class OnboardingState {}

final class OnboardingInitial extends OnboardingState {
  final List<Onboarding> onboardingItems;

  OnboardingInitial({required this.onboardingItems});
}

class OnboardingLoadedState extends OnboardingState {
  final int currentIndex;

  OnboardingLoadedState({required this.currentIndex});
}

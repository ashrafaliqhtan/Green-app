part of 'onboarding_bloc.dart';

@immutable
sealed class OnboardingEvent {}

class NextViewEvent extends OnboardingEvent{}

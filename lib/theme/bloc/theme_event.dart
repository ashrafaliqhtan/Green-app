part of 'theme_bloc.dart';

@immutable
sealed class ThemeEvent {}

class GetThemeEvent extends ThemeEvent {}

class UpdateThemeEvent extends ThemeEvent {}

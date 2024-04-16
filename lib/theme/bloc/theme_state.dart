part of 'theme_bloc.dart';

@immutable
sealed class ThemeState {}

final class ThemeInitial extends ThemeState {}

class ShowThemeState extends ThemeState {
  final ThemeData themeData;
  final String currentTheme;
  ShowThemeState(this.currentTheme, this.themeData);
}

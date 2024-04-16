import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:green_saudi_app/theme/theme.dart';
import 'package:meta/meta.dart';

import '../appearence manager/appearence_service.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final locator = GetIt.I.get<AppearanceServices>();
  late ThemeData themeInfo;
  ThemeBloc() : super(ThemeInitial()) {
    themeInfo = appThemes[locator.currentTheme]!;

    on<ThemeEvent>((event, emit) {});

    //Get theme event
    on<GetThemeEvent>(getAppTheme);

    on<UpdateThemeEvent>(updateTheme);
  }

  FutureOr<void> getAppTheme(event, emit) {
    locator.getTheme();
    themeInfo = appThemes[locator.currentTheme]!;
    emit(ShowThemeState(locator.currentTheme, themeInfo));
  }

  FutureOr<void> updateTheme(event, emit) {
    locator.changeTheme();
    themeInfo = appThemes[locator.currentTheme]!;
    print(locator.currentTheme);
    emit(ShowThemeState(locator.currentTheme, themeInfo));
  }
}

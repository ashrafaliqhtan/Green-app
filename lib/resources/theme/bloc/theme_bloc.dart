import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:green_saudi_app/resources/theme/theme.dart';
import 'package:meta/meta.dart';

import '../../../service/appearence_service.dart';

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
    // locator.getTheme();
    themeInfo = appThemes[locator.currentTheme]!;
    emit(ShowThemeState(locator.currentTheme, themeInfo));
  }



  FutureOr<void> updateTheme(UpdateThemeEvent event, Emitter<ThemeState> emit) {
    locator.currentTheme = event.isDark == true ? "Dark":"Light";
    locator.isDark(isDark:  event.isDark );
    emit(UpdateState());
  }
}

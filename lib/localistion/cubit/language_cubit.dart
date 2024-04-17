import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());
  final FlutterLocalization localization = FlutterLocalization.instance;
  void changeLanguage(String language) {
    localization.translate(language);
    emit(LanguageChange());
}
}

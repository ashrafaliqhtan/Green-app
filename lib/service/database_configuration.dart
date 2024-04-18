import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localization/flutter_localization.dart';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:translator/translator.dart';

databaseConfiguration() async {
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
      url: dotenv.env["Url"]!, anonKey: dotenv.env["AnonKey"]!);
}

Future<String> translatorFunction(String input) async {
  final FlutterLocalization localization = FlutterLocalization.instance;

  final translator = GoogleTranslator();
  final Translation translation = await translator.translate(input,
      to: localization.currentLocale!.languageCode);
  return translation.text;
}

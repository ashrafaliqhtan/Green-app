import 'package:flutter_localization/flutter_localization.dart';
import 'package:get_it/get_it.dart';
import 'package:green_saudi_app/service/supabase/supabase_services.dart';
import 'package:intl/intl.dart';
import 'package:translator/translator.dart';

Future<String> translatorFunction(String input) async {
  final FlutterLocalization localization = FlutterLocalization.instance;

  final translator = GoogleTranslator();
  final Translation translation = await translator.translate(input,
      to: localization.currentLocale!.languageCode);
  return translation.text;
}

String getTimeWithAmPm(String time) {
    // Parse the time string (assuming it's in HH:mm format)
    List<String> timeParts = time.split(':');
    int hour = int.parse(timeParts[0]);
    int minute = int.parse(timeParts[1]);

    // Create a DateTime object with today's date and the parsed hour and minute
    DateTime dateTime = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, hour, minute);

    // Format the DateTime object to include AM/PM
    DateFormat format = DateFormat.jm(
      GetIt.I.get<DBServices>().language!.languageCode
    ); // Use 'jm' format for AM/PM in Arabic
    return format.format(dateTime);
  }

  String getTime(String time) {
    // Parse the time string (assuming it's in HH:mm format)
    List<String> timeParts = time.split(':');
    int hour = int.parse(timeParts[0]);
    int minute = int.parse(timeParts[1]);

    // Create a DateTime object with today's date and the parsed hour and minute
    DateTime dateTime = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, hour, minute);

    // Format the DateTime object to include AM/PM
    DateFormat format = DateFormat.Hm();
    return format.format(dateTime);
  }
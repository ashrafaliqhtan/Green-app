import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:green_saudi_app/resources/extensions/screen_handler.dart';
import 'package:green_saudi_app/resources/localization/localization.dart';
import 'package:green_saudi_app/resources/utils/colors.dart';
import 'package:green_saudi_app/resources/utils/spacing.dart';
import 'package:green_saudi_app/service/translator_function.dart';

class HistoryHoursWidget extends StatelessWidget {
  const HistoryHoursWidget({super.key, required this.eventModel});
  final Map<String, dynamic> eventModel;
  @override
  Widget build(BuildContext context) {
    String hoursWorkedText;
    return FutureBuilder(
      future: Future.wait([
        translatorFunction(eventModel["event"].title),
      ]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final List<String> translatedTexts = snapshot.data as List<String>;
          final String eventName = translatedTexts[0];
          final String eventLocation = eventModel["event"].location!;
          final String timeText =
              "${getTimeWithAmPm(eventModel["event"].startTime!)}-${getTimeWithAmPm(eventModel["event"].endTime!)}";
          final String dateText =
              "${eventModel["event"].startDate!}-${eventModel["event"].endDate!}";
          if (eventModel["personalEvent"].days > 0) {
            hoursWorkedText =
                '${AppLocale.youGot.getString(context)} ${(8 * eventModel["personalEvent"].days)}  ${AppLocale.volunteer.getString(context)}';
          } else {
            hoursWorkedText = '';
          }
          return Column(
            children: [
              Container(
                width: context.getWidth(),
                height: context.getHeight() * 0.1954,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                  color: green,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            eventName,
                            style: TextStyle(
                              color: pureWhite,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          Text(
                            eventLocation,
                            style: const TextStyle(
                              color: Color.fromRGBO(240, 248, 255, 0.691),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                          height20,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                dateText,
                                style: TextStyle(
                                    height: 0.1,
                                    color: pureWhite,
                                    fontSize: 10),
                              ),
                              width4,
                              Text(
                                timeText,
                                style: TextStyle(
                                    height: 0.1,
                                    color: pureWhite,
                                    fontSize: 10),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 40,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: grey,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    width4,
                    Icon(
                      FontAwesomeIcons.clock,
                      color: green,
                    ),
                    width16,
                    Text(
                      hoursWorkedText,
                      style: TextStyle(
                        color: green,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      },
    );
  }
}

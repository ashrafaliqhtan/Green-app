import 'package:flutter/material.dart';
import 'package:green_saudi_app/model/event_model.dart';
import 'package:green_saudi_app/model/personal_event.dart';
import 'package:green_saudi_app/resources/extensions/screen_handler.dart';
import 'package:green_saudi_app/resources/utils/colors.dart';
import 'package:green_saudi_app/service/translator_function.dart';
import 'package:green_saudi_app/widgets/shimmer_point_widget.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({
    super.key,
    required this.personalEvent,
    required this.eventModel,
  });
  final PersonalEvent personalEvent;
  final EventModel eventModel;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([
        translatorFunction(personalEvent.name ?? "No Content"),
      ]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return shimmerEffectPoint();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final List<String> translatedTexts = snapshot.data!;
          final String eventTitle = translatedTexts[0];
          return Container(
            width: context.getWidth(),
            height: context.getHeight() * .155,
            margin:
                const EdgeInsets.only(bottom: 50, top: 20, right: 16, left: 16),
            decoration: BoxDecoration(
              color: green,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -20,
                  right: 60,
                  left: 60,
                  child: Container(
                    width: context.getWidth() * .640,
                    height: context.getHeight() * .058,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/images/Rectangle 104.jpg'),
                        fit: BoxFit.fitWidth,
                      ),
                      color: pureWhite,
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -10,
                  right: 100,
                  left: 100,
                  child: Container(
                    width: context.getWidth() * .65,
                    height: context.getHeight() * .048,
                    decoration: BoxDecoration(
                      color: pureWhite,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Center(
                      child: Text(
                        "",
                        style: TextStyle(
                          color: green,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Center(
                    child: Text(
                      eventTitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: pureWhite,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

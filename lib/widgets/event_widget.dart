import 'package:flutter/material.dart';
import 'package:green_saudi_app/model/event_model.dart';
import 'package:green_saudi_app/resources/extensions/screen_handler.dart';
import 'package:green_saudi_app/service/database_configuration.dart';
import 'package:green_saudi_app/resources/utils/colors.dart';
import 'package:green_saudi_app/views/details_event_view.dart';
import 'package:green_saudi_app/widgets/shimmer_point_widget.dart';

class EventWidget extends StatelessWidget {
  const EventWidget({super.key, required this.event});
  final EventModel event;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([
        translatorFunction(event.title ?? "لايوجد محتوى"),
        translatorFunction(event.location ?? "الرياض"),
      ]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return shimmerEffectPoint();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final List<String> translatedTexts = snapshot.data!;
          final String eventTitle = translatedTexts[0];
          final String location = translatedTexts[1];
          return InkWell(
            onTap: () {
              context.push(
                  view: EventDetailsView(
                    event: event,
                  ),
                  isPush: true);
            },
            child: Container(
              width: context.getWidth(),
              height: context.getHeight() * .155,
              margin: const EdgeInsets.only(
                  bottom: 50, top: 20, right: 16, left: 16),
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
                          //TODO: Event Image
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
                          location,
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
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          eventTitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: pureWhite,
                            fontSize: 22,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:green_saudi_app/extensions/screen_handler.dart';
import 'package:green_saudi_app/service/database_configuration.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/views/details_event_view.dart';

class EventWidget extends StatelessWidget {
  const EventWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([
        translatorFunction("تحويل إدارة النفايات"),
        translatorFunction("منطقة الجوف"),
      ]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(color: green));
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final List<String> translatedTexts = snapshot.data!;
          final String eventTitle = translatedTexts[0];
          final String location = translatedTexts[1];
          return InkWell(
            onTap: () {
              context.push(view: const EventDetailsView(), isPush: true);
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
                            fontSize: 22,
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
            ),
          );
        }
      },
    );
  }
}

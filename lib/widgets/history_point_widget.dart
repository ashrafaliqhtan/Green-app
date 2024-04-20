import 'package:flutter/material.dart';
import 'package:green_saudi_app/resources/extensions/screen_handler.dart';
import 'package:green_saudi_app/service/database_configuration.dart';
import 'package:green_saudi_app/resources/utils/colors.dart';
import 'package:green_saudi_app/resources/utils/spacing.dart';
import 'package:green_saudi_app/widgets/shimmer_point_widget.dart';

class PointWidget extends StatelessWidget {
  const PointWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([
        translatorFunction("تم الحصول على 12 نقطة"),
        translatorFunction("10/04/2024"),
        translatorFunction("5:04 PM"),
      ]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: shimmerEffectPoint());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final List<String> translatedTexts = snapshot.data as List<String>;
          final String pointsText = translatedTexts[0];
          final String dateText = translatedTexts[1];
          final String timeText = translatedTexts[2];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              width: context.getWidth(),
              height: context.getHeight() * .1,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 3,
                            height: context.getHeight() * .07,
                            color: green,
                          ),
                        ],
                      ),
                      width24,
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          pointsText,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      width24,
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, bottom: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          dateText,
                          style: const TextStyle(height: 0.1),
                        ),
                        width4,
                        Text(
                          timeText,
                          style: const TextStyle(height: 0.1),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

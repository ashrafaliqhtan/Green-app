import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:green_saudi_app/resources/extensions/screen_handler.dart';
import 'package:green_saudi_app/resources/localization/localization.dart';
import 'package:green_saudi_app/service/database_configuration.dart';
import 'package:green_saudi_app/resources/utils/colors.dart';
import 'package:green_saudi_app/resources/utils/spacing.dart';

class EventDetailsView extends StatelessWidget {
  const EventDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: pureWhite,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: pureWhite),
            onPressed: () {},
          ),
        ],
      ),
      body: FutureBuilder(
        future: Future.wait([
          translatorFunction(
              'زراعة أشجار المانجروف للمساهمة في تنظيف مياه البحر، وإثراء التنوع البيولوجي، واستعادة الحياة المائية.'),
          translatorFunction('زراعة الاشجار'),
          translatorFunction('الرياض - حي الرمال'),
          translatorFunction('١٢م الى ٤م'),
          translatorFunction('٤ أبريل ٢٠٢٤'),
        ]),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: green));
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final List<String> translatedTexts = snapshot.data!.cast<String>();
            final String description = translatedTexts[0];
            final String eventName = translatedTexts[1];
            final String eventLocation = translatedTexts[2];
            final String eventTime = translatedTexts[3];
            final String eventDate = translatedTexts[4];
            return Stack(
              children: [
                // Image and Description Section
                Positioned.fill(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 425,
                        child: Image.asset(
                          'assets/images/action-4.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      height56,
                      // Description
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          description,
                          style: TextStyle(
                            color: Colors.blueGrey[300],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                // Header Info Section (Location - Time - Date)
                Positioned(
                  top: 375,
                  left: 35,
                  right: 35,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 120,
                      width: context.getWidth(),
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        color: green,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[300]!,
                            blurRadius: 30,
                            offset: const Offset(0, 10),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                eventName,
                                style: TextStyle(
                                  color: pureWhite,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: pureWhite,
                                ),
                                width16,
                                Text(
                                  eventLocation,
                                  style: TextStyle(
                                    color: pureWhite,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      color: pureWhite,
                                    ),
                                    width16,
                                    Text(
                                      eventTime,
                                      style: TextStyle(
                                        color: pureWhite,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.calendar_month_outlined,
                                      color: pureWhite,
                                    ),
                                    width16,
                                    Text(
                                      eventDate,
                                      style: TextStyle(
                                        color: pureWhite,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // Button
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      onPressed: () {
                        //TODO: Register in Event for user
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Container(
                        height: 60,
                        alignment: Alignment.center,
                        child: Text(
                          AppLocale.signEvent.getString(context),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

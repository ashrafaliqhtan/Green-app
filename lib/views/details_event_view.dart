import 'package:flutter/material.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';

class EventDetailsView extends StatelessWidget {
  const EventDetailsView({Key? key});

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
      body: Stack(
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
                    "زراعة أشجار المانجروف للمساهمة في تنظيف مياه البحر، وإثراء التنوع البيولوجي، واستعادة الحياة المائية.",
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
            left: 50,
            right: 50,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 120,
                margin: const EdgeInsets.symmetric(horizontal: 14),
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
                      Text(
                        "زراعة الاشجار",
                        style: TextStyle(
                          color: pureWhite,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "الرياض - حي الرمال",
                            style: TextStyle(
                              color: pureWhite,
                            ),
                          ),
                          width16,
                          Icon(
                            Icons.location_on_outlined,
                            color: pureWhite,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '١٢م الى ٤م',
                                style: TextStyle(
                                  color: pureWhite,
                                ),
                              ),
                              width16,
                              Icon(
                                Icons.access_time,
                                color: pureWhite,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "٤ أبريل ٢٠٢٤",
                                style: TextStyle(
                                  color: pureWhite,
                                ),
                              ),
                              width16,
                              Icon(
                                Icons.calendar_month_outlined,
                                color: pureWhite,
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
                  child: const Text(
                    'سجل الآن',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:green_saudi_app/extensions/screen_handler.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';

class HistoryHoursWidget extends StatelessWidget {
  const HistoryHoursWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth(),
      height: context.getHeight() * .20,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: green,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(15),
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'زراعة الاشجار',
                    style: TextStyle(
                      color: pureWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const Text(
                    'الرياض - حي الرمال',
                    style: TextStyle(
                      color: Color.fromRGBO(240, 248, 255, 0.691),
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                  ),
                  height20,
                  Row(
                    children: [
                      Text(
                        "10/04/2024",
                        style: TextStyle(height: 0.1, color: pureWhite),
                      ),
                      width4,
                      Text(
                        "5:04 PM",
                        style: TextStyle(height: 0.1, color: pureWhite),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 35,
            width: double.infinity,
            decoration: BoxDecoration(
              color: grey,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "لقد حصلت على (٤) ساعة من عمل التطوع",
                  style: TextStyle(
                    color: green,
                  ),
                ),
                width16,
                 Icon(
                  FontAwesomeIcons.clock, color: green,
                ),
                width4,
              ],
            ),
          ),
        ],
      ),
    );
  }
}

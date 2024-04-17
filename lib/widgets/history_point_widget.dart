import 'package:flutter/material.dart';
import 'package:green_saudi_app/extensions/screen_handler.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';

class PointWidget extends StatelessWidget {
  const PointWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            width: context.getWidth(),
            height: context.getHeight() * .1,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                color: grey, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "لقد حصلت على 12 نقطة",
                          style: TextStyle(fontSize: 20),
                        )),
                    width24,
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
                  ],
                ),
                const Row(
                  children: [
                    Text(
                      "10/04/2024",
                      style: TextStyle(height: 0.1),
                    ),
                    width4,
                    Text(
                      "5:04 PM",
                      style: TextStyle(height: 0.1),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

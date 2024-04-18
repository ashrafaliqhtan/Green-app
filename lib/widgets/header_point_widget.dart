import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:green_saudi_app/extensions/screen_handler.dart';
import 'package:green_saudi_app/localistion/localistion.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';

class HeaderPoint extends StatelessWidget {
  const HeaderPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
      child: Container(
        width: context.getWidth(),
        height: context.getHeight() * .14,
        decoration: BoxDecoration(
          color: green,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -20,
              right: 100,
              left: 100,
              child: Container(
                width: context.getWidth() * .490,
                height: context.getHeight() * .048,
                decoration: BoxDecoration(
                    color: pureWhite, borderRadius: BorderRadius.circular(40)),
                child: Center(
                    child: Text(
                  AppLocale.rewards.getString(context),
                  style: TextStyle(
                    color: green,
                    fontSize: 22,
                  ),
                )),
              ),
            ),
            Positioned.fill(
              child: Column(
                children: [
                  height20,
                  Center(
                    child: Text(
                      AppLocale.rewardsPoint.getString(context),
                      style: TextStyle(
                        color: pureWhite,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "123",
                      style: TextStyle(
                        color: pureWhite,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

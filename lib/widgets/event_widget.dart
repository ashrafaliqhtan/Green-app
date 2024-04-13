import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_saudi_app/extensions/screen_handler.dart';
import 'package:green_saudi_app/utils/colors.dart';

class EventWidget extends StatelessWidget {
  const EventWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: context.getWidth(),
        height: context.getHeight() * .155,
        margin: const EdgeInsets.only(bottom: 50, top: 20, right: 16, left: 16),
        decoration: BoxDecoration(
            color: green, borderRadius: BorderRadius.circular(40)),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -20,
              right: 60,
              child: Container(
                width: context.getWidth() * .640,
                height: context.getHeight() * .058,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/images/Rectangle 104.jpg'),
                      fit: BoxFit.fitWidth,
                    ),
                    color: pureWhite,
                    borderRadius: BorderRadius.circular(40)),
              ),
            ),
            Positioned(
              bottom: -10,
              right: 100,
              left: 100,
              child: Container(
                width: context.getWidth() * .490,
                height: context.getHeight() * .048,
                decoration: BoxDecoration(
                    color: pureWhite, borderRadius: BorderRadius.circular(40)),
                child: Center(
                    child: Text(
                  "الرياض",
                  style: TextStyle(
                    color: green,
                    fontSize: 25,
                  ),
                )),
              ),
            ),
            Positioned(
              bottom: 50,
              right: 50,
              left: 50,
              child: Center(
                  child: Text(
                "تحويل إدارة النفايات",
                style: TextStyle(
                  color: pureWhite,
                  fontSize: 30,
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}

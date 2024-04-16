import 'package:flutter/material.dart';
import 'package:green_saudi_app/extensions/screen_handler.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';
import 'package:green_saudi_app/views/bottom_nav_bar/view/bottom_nav_bar.dart';

class settingsButton extends StatelessWidget {
  String title;
  IconData icons;
  settingsButton({
    super.key,
    required this.title,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(view:  BottomNavBar(), isPush: true);
      },
      child: Container(
        height: 65,
        width: 345,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            color: green),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            textDirection: TextDirection.rtl,
            children: [
              Icon(icons),
              width8,
              Text(title),
              width150,
              width30,
              const Icon(Icons.arrow_back_ios),
            ],
          ),
        ),
      ),
    );
  }
}

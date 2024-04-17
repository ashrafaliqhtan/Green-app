import 'package:flutter/material.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';
import 'dart:math' as math;

class SettingsButton extends StatelessWidget {
   SettingsButton({
    super.key,
    required this.title,
    required this.icons,
    required this.onTap
  });
  final String title;
  final IconData icons;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
            children: [
              Icon(icons),
              width8,
              Text(title),
              width150,
              width30,
               Transform.rotate(
                angle: math.pi,
                child: Icon(Icons.arrow_back_ios),
              )
            ],
          ),
        ),
      ),
    );
  }
}

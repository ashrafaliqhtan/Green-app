import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_saudi_app/extensions/screen_handler.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';

class GoalsWidget extends StatelessWidget {
  const GoalsWidget(
      {super.key,
      required this.img,
      required this.text,
      this.isDivider = true});

  final String img;
  final String text;
  final bool isDivider;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth(),
      height: context.getHeight() * 0.183,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.transparent, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: pureWhite),
                ),
              ),
              width16,
              Image.asset(
                img,
                width: 100,
                height: 100,
              ),
            ],
          ),
          (isDivider) ? Divider() : SizedBox()
        ],
      ),
    );
  }
}

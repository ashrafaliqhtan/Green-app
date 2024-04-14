import 'package:flutter/material.dart';
import 'package:green_saudi_app/utils/colors.dart';

class TextProfile extends StatelessWidget {
  String title;
  String data;
  TextProfile({
    required this.title,
    required this.data,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 350,
        height: 80,
        decoration: BoxDecoration(
            color: pureWhite, borderRadius: BorderRadius.circular(40)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              Icon(
                Icons.man_outlined,
                color: green,
                shadows: [Shadow(color: black, blurRadius: 10)],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(title), Text(data)],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

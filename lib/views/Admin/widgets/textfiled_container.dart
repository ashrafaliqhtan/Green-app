
import 'package:flutter/material.dart';
import 'package:green_saudi_app/utils/colors.dart';

class TextfiledContainer extends StatelessWidget {
  const TextfiledContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 60,
      child: TextField(
        textDirection: TextDirection.rtl,
        decoration: InputDecoration(
            filled: true,
            fillColor: pureWhite,
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(40))),
      ),
    );
  }
}
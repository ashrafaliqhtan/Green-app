
import 'package:flutter/material.dart';
import 'package:green_saudi_app/utils/colors.dart';

class TextfieldContainer extends StatelessWidget {
  const TextfieldContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 60,
      child: TextField(
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
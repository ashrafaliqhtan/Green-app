import 'package:flutter/cupertino.dart';
import 'package:green_saudi_app/utils/colors.dart';

class RegionsWidget extends StatelessWidget {
  RegionsWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      height: 35,
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration:
          BoxDecoration(color: green, borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: pureWhite),
        ),
      ),
    );
  }
}

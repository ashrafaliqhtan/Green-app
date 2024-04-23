import 'package:flutter/material.dart';
import 'package:green_saudi_app/resources/utils/colors.dart';

class IconDisplay extends StatelessWidget {
  final bool? isSuccess;

  const IconDisplay({Key? key, this.isSuccess}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color circleColor;
    IconData iconData;

    if (isSuccess == null) {
      circleColor = Colors.yellow;
      iconData = Icons.cancel;
    } else if (isSuccess!) {
      circleColor = green;
      iconData = Icons.check_circle;
    } else {
      circleColor = red;
      iconData = Icons.cancel;
    }

    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: circleColor,
      ),
      child: Center(
        child: Icon(
          iconData,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}

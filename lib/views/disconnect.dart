import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_saudi_app/resources/utils/colors.dart';
import 'package:green_saudi_app/resources/utils/spacing.dart';

class Disconnect extends StatelessWidget {
  const Disconnect({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //TODO: fix offline-concept-illustration_114360-7063 add it in the image file
              SvgPicture.asset(
                  "assets/icons/No_connection-pana.svg",),
              height16,
              Text(
                'No internet connection',
                style: TextStyle(fontSize: 30, color: green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

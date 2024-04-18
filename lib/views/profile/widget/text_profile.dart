import 'package:flutter/material.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';

class TextProfile extends StatelessWidget {
  final String title;
  final String data;
  final IconData? icon;
  const TextProfile({
    required this.title,
    required this.data,
    super.key, this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 350,
        height: 80,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(40)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                Icons.man_outlined,
                color: green,
                shadows: [Shadow(color: black, blurRadius: 10)],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      icon,
                      color: green,
                    ),
                    width150,
                    width24,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text(title), Text(data)],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

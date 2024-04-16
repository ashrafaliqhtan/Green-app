import 'package:flutter/material.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';

class SettingsSwitch extends StatelessWidget {
  const SettingsSwitch({
    super.key,
    required this.title,
    required this.icons,
  });
  final String title;
  final IconData icons;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 345,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(30)), color: green),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            Icon(icons),
            width8,
            Text(title),
            width130,
            width16,
            Switch(value: true, onChanged: (value) {})
          ],
        ),
      ),
    );
  }
}

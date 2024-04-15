import 'package:flutter/material.dart';
import 'package:green_saudi_app/theme/theme_provider.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';
import 'package:provider/provider.dart';

class settingsSwitch extends StatelessWidget {
  String title;
  IconData icons;
  settingsSwitch({
    super.key,
    required this.title,
    required this.icons,
  });

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
            Switch(value: true, onChanged: (value) {
              Provider.of<ThemeProvider>(context,listen: false).toggleTheme();
            })
          ],
        ),
      ),
    );
  }
}
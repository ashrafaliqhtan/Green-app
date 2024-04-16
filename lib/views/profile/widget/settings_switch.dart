import 'package:flutter/material.dart';
import 'package:green_saudi_app/theme/theme_provider.dart';
import 'package:green_saudi_app/utils/colors.dart';

import 'package:green_saudi_app/views/profile/widget/custom_switch.dart';
import 'package:provider/provider.dart';

class SettingsSwitch extends StatefulWidget {
  final String title;
  final IconData icon;

  const SettingsSwitch({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  State<SettingsSwitch> createState() => _SettingsSwitchState();
}

class _SettingsSwitchState extends State<SettingsSwitch> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 345,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        color: green,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          textDirection: TextDirection.rtl,
          children: [
            Icon(widget.icon),
            const SizedBox(width: 8),
            Text(widget.title),
            const Spacer(),
            CustomSwitch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value; 
                    Provider.of<ThemeProvider>(context,listen: false).toggleTheme();
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function()? onTap;

  const DrawerItem({
    super.key,
    required this.icon,
    required this.title, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            IconButton(
                onPressed: onTap,
                icon: Icon(
                  icon,
                  color: pureWhite,
                  size: 30,
                )),
            width8,
            Text(
              title,
              style: TextStyle(
                color: pureWhite,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}

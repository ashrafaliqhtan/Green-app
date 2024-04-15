import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_saudi_app/utils/colors.dart';

class AdminPanel extends StatelessWidget {
  const AdminPanel({
    super. key,
    required this.address,
    required this.panelIcon,
    required this.onTap,
  }) ;

  final String address;
  final String panelIcon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: green,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            height: 90,
            width: 350,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    address,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(panelIcon),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

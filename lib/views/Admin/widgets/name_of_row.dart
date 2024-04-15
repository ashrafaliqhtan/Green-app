
import 'package:flutter/material.dart';
import 'package:green_saudi_app/utils/colors.dart';

class NameRow extends StatelessWidget {
  const NameRow({super.key, required this.rowName});
  final String rowName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20, top: 10),
          child: Text(rowName,
              style: TextStyle(
                fontSize: 24,
                color: black,
              )),
        ),
      ],
    );
  }
}
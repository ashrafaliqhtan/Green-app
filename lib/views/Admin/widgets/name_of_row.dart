
import 'package:flutter/material.dart';

class NameRow extends StatelessWidget {
  const NameRow({super.key, required this.rowName});
  final String rowName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20, top: 10,left: 20),
          child: Text(rowName,
              style: const TextStyle(
                fontSize: 24,
              )),
        ),
      ],
    );
  }
}
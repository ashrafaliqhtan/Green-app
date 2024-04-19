
import 'package:flutter/material.dart';
import 'package:green_saudi_app/resources/utils/colors.dart';

class RewordContainer extends StatelessWidget {
  const RewordContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6, 
      itemBuilder: (context, index) {
        return Row(
          children: [
            Expanded(
              child: Container(
                height: 140,
                width: 125,
                decoration: BoxDecoration(
                    color: index.isEven ? white : white,
                    borderRadius: BorderRadius.circular(8)),
                margin: const EdgeInsets.all(8),
                alignment: Alignment.center,
                child: Text('Container ${(index * 2) + 1}'),
              ),
            ),
            Expanded(
              child: Container(
                height: 140,
                width: 125,
                decoration: BoxDecoration(
                    color: index.isEven ? white : white,
                    borderRadius: BorderRadius.circular(8)),
                margin: const EdgeInsets.all(8),
                alignment: Alignment.center,
                child: Text('Container ${(index * 2) + 2}'),
              ),
            ),
          ],
        );
      },
    );
  }
}
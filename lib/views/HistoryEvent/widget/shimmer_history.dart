import 'package:flutter/material.dart';
import 'package:green_saudi_app/resources/utils/colors.dart';
import 'package:shimmer/shimmer.dart';

class HistoryShimmer extends StatelessWidget {
  const HistoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: double.infinity,
        height: 120.0,
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: green,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 20.0,
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            ),
            Container(
              width: double.infinity,
              height: 20.0,
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
            ),
            Container(
              width: double.infinity,
              height: 20.0,
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
            ),
            Container(
              width: double.infinity,
              height: 20.0,
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
            ),
          ],
        ),
      ),
    );
  }
  }



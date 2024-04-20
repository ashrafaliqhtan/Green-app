import 'package:flutter/material.dart';
import 'package:green_saudi_app/resources/utils/colors.dart';
import 'package:green_saudi_app/resources/utils/spacing.dart';

import 'package:shimmer/shimmer.dart';

Widget shimmerEffectPoint() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Card(
      color: pureWhite,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(10),
        color: grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            height10,
            Divider(
              height: 3,
              thickness: 4,
              color: grey,
            ),
            height10,
            Container(
              width: double.infinity,
              height: 20,
              color: Colors.white,
            ),
          ],
        ),
      ),
    ),
  );
}

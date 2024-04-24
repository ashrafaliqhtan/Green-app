import 'package:flutter/material.dart';
import 'package:green_saudi_app/resources/utils/spacing.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffectOffer extends StatelessWidget {
  const ShimmerEffectOffer({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Card(
          color: Colors.white, 
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(10),
            color: Colors.grey, 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                height10,
                const Divider(
                  height: 3,
                  thickness: 4,
                  color: Colors.grey, 
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
      ),
    );
  }
}

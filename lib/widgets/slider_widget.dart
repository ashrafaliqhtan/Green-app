import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SliderWidget extends StatelessWidget {
  final List<String> imageAsset = [
    'assets/images/action-1.jpg',
    'assets/images/action-2.jpg',
    'assets/images/action-3.jpg',
    'assets/images/action-4.jpg'
  ];

  SliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 140,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            onPageChanged: (index, reason) {},
          ),
          items: imageAsset.map((img) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Image.asset(img, fit: BoxFit.cover),
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:green_saudi_app/views/bottom_nav_bar/view/bottom_nav_bar.dart';
import 'package:lottie/lottie.dart';



class FutureDelayedWidget extends StatefulWidget {
  @override
  _FutureDelayedWidgetState createState() => _FutureDelayedWidgetState();
}

class _FutureDelayedWidgetState extends State<FutureDelayedWidget> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BottomNavBar()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
       child: Lottie.asset('assets/icons/Animation1713616803149.json')
      ),
    );
  }
}

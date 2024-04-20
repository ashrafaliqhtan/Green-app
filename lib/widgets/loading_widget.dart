import 'package:flutter/material.dart';

class DotLoadingIndicator extends StatefulWidget {
  @override
  _DotLoadingIndicatorState createState() => _DotLoadingIndicatorState();
}

class _DotLoadingIndicatorState extends State<DotLoadingIndicator> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5, 
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.green, 
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }
}

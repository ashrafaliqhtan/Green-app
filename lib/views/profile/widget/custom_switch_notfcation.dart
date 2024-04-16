
import 'package:flutter/material.dart';
import 'package:green_saudi_app/utils/colors.dart';

class CustomSwitchNotfcation extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  const CustomSwitchNotfcation({
    Key? key,
    required this.value,
    this.onChanged,
  }) : super(key: key);

  @override
  CustomSwitchNotfcationState createState() => CustomSwitchNotfcationState();
}

class CustomSwitchNotfcationState extends State<CustomSwitchNotfcation> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onChanged != null) {
          widget.onChanged!(!widget.value); 
        }
      },
      child: Container(
        width: 64,
        height: 34,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: widget.value ?  white : white,
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 400),
              left: widget.value ? 32 : 2,
              bottom: 2,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:  white
                ),
              ),
            ),
            Positioned(
              top: 6,
              left: 36,
              child: AnimatedOpacity(
                opacity: widget.value ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 400),
                child: const Icon(
                  Icons.notifications_off,
                  size: 24,
                  color: Colors.red,
                ),
              ),
            ),
            Positioned(
              top: 5,
              left: 5,
              child: AnimatedOpacity(
                opacity: widget.value ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 400),
                child:  Icon(
                  Icons.notifications_on,
                  size: 24,
                  color: green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
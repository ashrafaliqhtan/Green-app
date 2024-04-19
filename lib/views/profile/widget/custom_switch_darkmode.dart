import 'package:flutter/material.dart';
import 'package:green_saudi_app/resources/utils/colors.dart';

class CustomSwitchDarkMode extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  const CustomSwitchDarkMode({
    super.key,
    required this.value,
    this.onChanged,
  });

  @override
  CustomSwitchDarkModeState createState() => CustomSwitchDarkModeState();
}

class CustomSwitchDarkModeState extends State<CustomSwitchDarkMode> {
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
          color: widget.value ?  const Color(0xFF73C0FC) : const Color.fromARGB(255, 19, 38, 64),
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
                  Icons.wb_sunny,
                  size: 24,
                  color: Colors.amber,
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
                  Icons.nightlight_round,
                  size: 24,
                  color: Colors.grey[700],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

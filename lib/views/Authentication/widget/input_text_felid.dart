import 'package:flutter/material.dart';
import 'package:green_saudi_app/resources/extensions/screen_handler.dart';
import 'package:green_saudi_app/resources/utils/colors.dart';
import 'package:green_saudi_app/resources/utils/spacing.dart';

// ignore: must_be_immutable
class InputTextFelid extends StatelessWidget {
  InputTextFelid({
    super.key,
    required this.title,
    required this.isPassword,
    this.icon,
    required this.controller,
    this.hintText,
    this.isColorChange = false, this.type,
  });
  final String title;
  final IconData? icon;
  final bool isPassword;
  String? hintText;
  final bool isColorChange;
  TextEditingController controller;
  final TextInputType? type;

  @override
  Widget build(BuildContext context) {
    bool isObscureText = true;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: (isColorChange) ? green : white,
              fontSize: 24,
            ),
          ),
          height8,
          Container(
            width: context.getWidth(),
            height: 70,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: greenCalm,
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: TextField(
              controller: controller,
              cursorColor: green,
              obscureText: isPassword,
              maxLines: 1,
              keyboardType: type,
              decoration: InputDecoration(
                hintText: hintText,
                suffixIcon: isPassword
                    ? IconButton(
                        onPressed: () {
                          if (isObscureText) {
                            isObscureText = !isObscureText;
                          } else {
                            isObscureText = true;
                          }
                        },
                        icon: Icon(
                          Icons.remove_red_eye_outlined,
                          color: black,
                          size: 24,
                        ),
                      )
                    : null,
                filled: true,
                fillColor: white,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(
                    color: greenLight,
                    width: 4,
                    style: BorderStyle.solid,
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: greenLight,
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
                prefixIcon: Icon(
                  icon,
                  color: green,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

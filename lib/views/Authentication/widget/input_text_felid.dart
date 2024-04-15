import 'package:flutter/material.dart';
import 'package:green_saudi_app/extensions/screen_handler.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';

// ignore: must_be_immutable
class InputTextFelid extends StatelessWidget {
  InputTextFelid({
    super.key,
    required this.title,
    required this.isPassword,
    this.icon,
    required this.controller,
  });
  final String title;
  final IconData? icon;
  final bool isPassword;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    bool isObscureText = true;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: TextStyle(
              color: white,
              fontSize: 24,
            ),
          ),
          height8,
          Container(
            width: context.getWidth(),
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: greenLight,
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: TextField(
              controller: controller,
              obscureText: isPassword,
              decoration: InputDecoration(
                prefixIcon: isPassword
                    ? IconButton(
                        onPressed: () {
                          if (isObscureText) {
                            isObscureText = !isObscureText;
                          } else {
                            isObscureText = true;
                          }
                        },
                        icon: const Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.green,
                          size: 24,
                        ),
                      )
                    : const SizedBox(),
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
                suffixIcon: Icon(
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

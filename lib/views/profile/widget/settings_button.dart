import 'package:flutter/material.dart';
import 'package:green_saudi_app/resources/utils/colors.dart';

// ignore: must_be_immutable
class SettingsButton extends StatelessWidget {
   SettingsButton({
    super.key,
    required this.title,
    required this.icons,
    required this.onTap
  });
  final String title;
  final IconData icons;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 65,
        width: 345,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            color: green),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(icons,color: pureWhite,),
              Text(title,style: TextStyle(color: pureWhite,fontWeight: FontWeight.bold,fontSize: 24),),
               const Icon(Icons.arrow_forward_ios,color: Colors.white,),
            ],
          ),
        ),
      ),
    );
  }
}

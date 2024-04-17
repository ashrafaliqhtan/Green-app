import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:green_saudi_app/extensions/screen_handler.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';
import 'package:green_saudi_app/views/Authentication/bloc/auth_bloc.dart';
import 'package:green_saudi_app/views/Authentication/view/login_view.dart';
import 'package:green_saudi_app/views/Drawer/widget/drawer_widget.dart';
import 'package:green_saudi_app/views/profile/view/profile_user.dart';
import 'package:green_saudi_app/views/profile/view/settings_user.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth() * .7,
      decoration: BoxDecoration(
          color: green,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20))),
      padding: const EdgeInsets.only(top: 50, bottom: 70, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(),
              width16,
              Text(
                'Sultan Alotaibi',
                style: TextStyle(
                  color: pureWhite,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          Column(
            children: [
              DrawerItem(
                icon: Icons.person,
                title: 'الحساب',
                onTap: () {
                  context.push(view: ProfileUser(), isPush: false);
                },
              ),
              const DrawerItem(
                icon: Icons.info,
                title: 'من نحن',
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Divider(color: pureWhite,thickness: 0.2,height: 0.2,),
              ),
              const DrawerItem(
                icon: Icons.eco,
                title: 'Sustainability',
              ),
              const DrawerItem(
                icon: Icons.nature,
                title: 'Nature',
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Divider(color: pureWhite,thickness: 0.2,height: 0.2,),
              ),
            ],
          ),
          height20,
          Row(
            children: [
              Icon(Icons.settings, color: pureWhite),
              width8,
              Text(
                'الاعدادات',
                style: TextStyle(color: pureWhite, fontWeight: FontWeight.bold),
              ),
              width8,
              Container(width: 2, height: 20, color: pureWhite),
              width8,
              Text(
                'تسجيل الخروج',
                style: TextStyle(color: pureWhite, fontWeight: FontWeight.bold),
              )
            ],
          ),
          height20,
          Row(
            children: [
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.facebook_outlined, color: pureWhite,
                  )),
              IconButton(
                  onPressed: () {}, icon: Icon(FontAwesomeIcons.instagram,  color: pureWhite,
                  )),
              IconButton(
                  onPressed: () {}, icon: Icon(FontAwesomeIcons.youtube,  color: pureWhite,
                  )),
              IconButton(
                  onPressed: () {}, icon: Icon(FontAwesomeIcons.twitter,  color: pureWhite,
                  )),
            ],
          )
        ],
      ),
    );
  }
}

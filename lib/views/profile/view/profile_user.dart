import 'package:flutter/material.dart';

import 'package:green_saudi_app/extensions/screen_handler.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/views/Hours%20History/view/history_point_view.dart';
import 'package:green_saudi_app/views/bottom_nav_bar/view/bottom_nav_bar.dart';
import 'package:green_saudi_app/views/home_view.dart';
import 'package:green_saudi_app/views/profile/view/settings_user.dart';
import 'package:green_saudi_app/views/profile/widget/text_profile.dart';

class ProfileUser extends StatelessWidget {
  const ProfileUser({super.key});

  @override
  Widget build(BuildContext context) {
    textDirectionToAxisDirection(TextDirection.rtl);
    return Scaffold(
      backgroundColor: greyLight,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.push(view: BottomNavBar(), isPush: false);
            },
            icon: Icon(
              Icons.arrow_back,
              color: pureWhite,
            )),
        actions: [
          Text(
            "الحساب",
            style: TextStyle(color: pureWhite, fontSize: 25),
          )
        ],
        backgroundColor: green,
        automaticallyImplyLeading: true,
        title: IconButton(
            onPressed: () {
              context.push(view: const SettingsUser(), isPush: true);
            },
            icon: Icon(
              Icons.settings,
              color: pureWhite,
            )),
      ),
      body: Center(
        child: Column(
          textDirection: TextDirection.rtl,
          children: [
            SizedBox(
              height: 125,
              width: 125,
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Image.network(
                      "https://image.movieglu.com/7772/GBR_007772h0.jpg"),
                ),
              ),
            ),
            const Text("أحمد موسى"),
            InkWell(
              onTap: () {
                context.push(view: const HoursHistoryView(), isPush: false);
              },
              child: const TextProfile(
                title: "ساعات التطوع",
                data: "ساعة100",
                icon: Icons.arrow_back_ios_new,
              ),
            ),
            const TextProfile(
              title: "الايميل",
              data: "ex@gmail.com",
            ),
            const TextProfile(
              title: "المدينة",
              data: "المدينة المنورة",
            ),
            const TextProfile(
              title: "رقم الجوال",
              data: "0591234567",
            ),
          ],
        ),
      ),
    );
  }
}

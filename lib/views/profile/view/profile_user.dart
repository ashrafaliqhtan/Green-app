import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import 'package:green_saudi_app/extensions/screen_handler.dart';
import 'package:green_saudi_app/localistion/localistion.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/views/Hours%20History/view/Hours_history.dart';
import 'package:green_saudi_app/views/bottom_nav_bar/view/bottom_nav_bar.dart';
import 'package:green_saudi_app/views/profile/view/settings_user.dart';
import 'package:green_saudi_app/views/profile/widget/text_profile.dart';

class ProfileUser extends StatelessWidget {
   ProfileUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
            AppLocale.account.getString(context),
            style: TextStyle(color: pureWhite, fontSize: 25),
          )
        ],
        backgroundColor: green,
        automaticallyImplyLeading: true,
        title: IconButton(
            onPressed: () {
              context.push(view:  SettingsUser(), isPush: true);
            },
            icon: Icon(
              Icons.settings,
              color: pureWhite,
            )),
      ),
      body: Center(
        child: Column(
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
             Text("أحمد موسى"),
            InkWell(
              onTap: () {
                context.push(view:  HoursHistoryView(), isPush: false);
              },
              child:  TextProfile(
                title: AppLocale.volunteerHours.getString(context),
                data: "ساعة100",
                icon: Icons.arrow_back_ios_new,
              ),
            ),
             TextProfile(
              title:AppLocale.email.getString(context),
              data: "ex@gmail.com",
            ),
             TextProfile(
              title:  AppLocale.city.getString(context),
              data: "المدينة المنورة",
            ),
             TextProfile(
              title:  AppLocale.phoneNumber.getString(context),
              data: "0591234567",
            ),
          ],
        ),
      ),
    );
  }
}

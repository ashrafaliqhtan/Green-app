import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:green_saudi_app/data_layer/data_layer.dart';
import 'package:green_saudi_app/extensions/screen_handler.dart';
import 'package:green_saudi_app/localization/localization.dart';
import 'package:green_saudi_app/service/supabase_services.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';
import 'package:green_saudi_app/views/Hours%20History/view/Hours_history.dart';
import 'package:green_saudi_app/views/bottom_nav_bar/view/bottom_nav_bar.dart';
import 'package:green_saudi_app/views/profile/view/settings_user.dart';
import 'package:green_saudi_app/views/profile/widget/text_profile.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ProfileUser extends StatelessWidget {
  const ProfileUser({super.key});

  @override
  Widget build(BuildContext context) {
    final serviceLocator = DataInjection().locator.get<DBServices>();
    final user = serviceLocator.user;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.push(view:const BottomNavBar(), isPush: false);
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
              context.push(view:const SettingsUser(), isPush: true);
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
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/2048px-User-avatar.svg.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Text(user.name ?? "Name"),
            InkWell(
              onTap: () {
                context.push(view: const HoursHistoryView(), isPush: false);
              },
              child: TextProfile(
                title: AppLocale.volunteerHours.getString(context),
                data: "ساعة${user.volunteerHours ?? "0"}",
                icon: Icons.arrow_back_ios_new,
              ),
            ),
            TextProfile(
              title: AppLocale.email.getString(context),
              data: "",
              // data: serviceLocator.email,
            ),
            TextProfile(
              title: AppLocale.city.getString(context),
              data: serviceLocator.user.city ?? "الرياض",
            ),
            TextProfile(
              title: AppLocale.phoneNumber.getString(context),
              data: serviceLocator.user.phoneNumber ?? "0500500505",
            ),
            height26,
            QrImageView(
              data: serviceLocator.userID,
              size: 200,
            ),
          ],
        ),
      ),
    );
  }
}

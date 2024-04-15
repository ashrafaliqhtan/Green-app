import 'package:flutter/material.dart';
import 'package:green_saudi_app/extensions/screen_handler.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';
import 'package:green_saudi_app/views/profile/view/edit_profile_user.dart';
import 'package:green_saudi_app/views/profile/widget/settings_button.dart';
import 'package:green_saudi_app/views/profile/widget/settings_switch.dart';

class SettingsUser extends StatelessWidget {
  const SettingsUser({super.key});

  @override
  Widget build(BuildContext context) {
    textDirectionToAxisDirection(TextDirection.rtl);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        actions: const [Text("الإعدادات")],
        backgroundColor: green,
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Column(
          textDirection: TextDirection.rtl,
          children: [
            InkWell(
              onTap: () {
               context.push(view: const EditProfileUser(), isPush: true);
              },
              child: Container(
                height: 100,
                width: 430,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(14),
                        bottomRight: Radius.circular(14))),
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    SizedBox(
                      height: 72,
                      width: 72,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: Image.network(
                            "https://image.movieglu.com/7772/GBR_007772h0.jpg"),
                      ),
                    ),
                    const Column(
                      children: [Text("أحمد موسى"), Text("تعديل الملف الشخصي")],
                    )
                  ],
                ),
              ),
            ),
            height16,
            settingsButton(title: "تغير كلمة السر", icons: Icons.password),
            height16,
            settingsButton(title: "تعديل الايميل", icons: Icons.email_outlined),
            height16,
            settingsSwitch(title: "الاشعارات", icons: Icons.notifications),
            height16,
            settingsSwitch(title: "الوضع الداكن", icons: Icons.sunny),
            height16,
            settingsButton(title: "اللغة", icons: Icons.language),
            Container(
              color: green,
              child: const Text("تسجيل الخروج"),
            )
          ],
        ),
      ),
    );
  }
}

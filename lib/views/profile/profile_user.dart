import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:green_saudi_app/extensions/screen_handler.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/views/profile/settings_user.dart';
import 'package:green_saudi_app/views/profile/widget/text_profile.dart';

class ProfileUser extends StatelessWidget {
  const ProfileUser({super.key});

  @override
  Widget build(BuildContext context) {
    textDirectionToAxisDirection(TextDirection.rtl);
    return Scaffold(
      backgroundColor: greyLight,
      appBar: AppBar(
        actions: [Text("الحساب")],
        backgroundColor: green,
        automaticallyImplyLeading: true,
        title: IconButton(
            onPressed: () {
              context.push(view: SettingsUser(), isPush: true);
            },
            icon: Icon(Icons.settings)),
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
            Text("أحمد موسى"),
            TextProfile(
              title: "ساعات التطوع",
              data: "ساعة100",
            ),
            TextProfile(
              title: "الايميل",
              data: "ex@gmail.com",
            ),
            TextProfile(
              title: "المدينة",
              data: "المدينة المنورة",
            ),
            TextProfile(
              title: "رقم الجوال",
              data: "0591234567",
            ),
          ],
        ),
      ),
    );
  }
}


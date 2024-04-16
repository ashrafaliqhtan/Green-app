import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:green_saudi_app/extensions/screen_handler.dart';
import 'package:green_saudi_app/localistion/cubit/language_cubit.dart';
import 'package:green_saudi_app/localistion/localistion.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';
import 'package:green_saudi_app/views/onboarding/view/onboarding_view.dart';
import 'package:green_saudi_app/views/profile/view/edit_profile_user.dart';
import 'package:green_saudi_app/views/profile/widget/settings_button.dart';
import 'package:green_saudi_app/views/profile/widget/settings_switch.dart';

class SettingsUser extends StatelessWidget {
  const SettingsUser({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit=context.read<LanguageCubit>();
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        actions:  [Text(AppLocale.SettingsTitle.getString(context))],
        backgroundColor: green,
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                context.push(view: const EditProfileUser(), isPush: true);
              },
              child: Container(
                height: 100,
                width: 430,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(14),
                        bottomRight: Radius.circular(14))),
                child: Row(
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
                     Column(
                      children: [Text("أحمد موسى"), Text(AppLocale.editProfile.getString(context))],
                    )
                  ],
                ),
              ),
            ),
            height16,
             SettingsButton(title: AppLocale.changePassword.getString(context), icons: Icons.password,onTap: (){context.push(view: OnboardingView(), isPush: true);},),
            height16,
             SettingsButton(title: AppLocale.email.getString(context), icons: Icons.email_outlined,onTap: (){}),
            height16,
            SettingsSwitch(title: AppLocale.notification.getString(context), icon: Icons.notifications, isDarkMode: false,),
            height16,
            SettingsSwitch(title: AppLocale.darkMode.getString(context), icon: Icons.sunny, isDarkMode: true,),
            height16,
             SettingsButton(title: AppLocale.languageButton.getString(context), icons: Icons.language,onTap: (){showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => cubit.changeLanguage("ar"),
              child: const Text('العربية'),
            ),
            TextButton(
              onPressed: () => cubit.changeLanguage("en"),
              child: const Text('english'),
            ),
          ],
        ),
      );}),
            Container(
              color: green,
              child:  Text(AppLocale.logoutButton.getString(context)),
            ),
          ],
        ),
      ),
    );
  }
}
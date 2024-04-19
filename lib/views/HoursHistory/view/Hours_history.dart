import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:green_saudi_app/resources/extensions/screen_handler.dart';
import 'package:green_saudi_app/resources/localization/localization.dart';
import 'package:green_saudi_app/resources/utils/colors.dart';
import 'package:green_saudi_app/views/HoursHistory/widget/history_hours_widget.dart';
import 'package:green_saudi_app/views/Profile/view/profile_user.dart';

class HoursHistoryView extends StatelessWidget {
  const HoursHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              context.push(view:  ProfileUser(), isPush: false);
            },
            icon: Icon(Icons.arrow_back, color: green,)),
        title: Text(
          AppLocale.volunteerHours.getString(context),
          style: TextStyle(
              color: green, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: ((context, index) {
          return const HistoryHoursWidget();
        }),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:green_saudi_app/extensions/screen_handler.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/views/Hours%20History/widget/history_hours_widget.dart';
import 'package:green_saudi_app/views/profile/view/profile_user.dart';

class HoursHistoryView extends StatelessWidget {
  const HoursHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        leading: IconButton(
            onPressed: () {
              context.push(view:  ProfileUser(), isPush: false);
            },
            icon: Icon(Icons.arrow_back, color: green,)),
        title: Text(
          "ساعات التطوع",
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

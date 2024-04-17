import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:green_saudi_app/extensions/screen_handler.dart';
import 'package:green_saudi_app/localistion/localistion.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';
import 'package:green_saudi_app/views/Admin/bottom_nav_bar_admin/view/bottom_nav_bar_admin.dart';
import 'package:green_saudi_app/views/Admin/widgets/name_of_row.dart';
import 'package:green_saudi_app/views/Admin/widgets/textfiled_container.dart';

class AddEvent extends StatelessWidget {
  const AddEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        actionsIconTheme: IconThemeData(color: pureWhite),
        backgroundColor: green,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              AppLocale.addEvent.getString(context),
              style: TextStyle(
                color: pureWhite,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // First row
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: black),
                        borderRadius: BorderRadius.circular(20),
                        color: pureWhite),
                    height: 100,
                    width: 100,
                    child: const Icon(Icons.add),
                  ),
                  Text(AppLocale.addImageEvent.getString(context),
                      style: const TextStyle(
                        fontSize: 24,
                      )),
                ],
              ),
            ),
            NameRow(
              rowName: AppLocale.eventName.getString(context),
            ),
            height16,
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: TextfieldContainer(),
            ),
            height26,
            NameRow(
              rowName: AppLocale.addDescription.getString(context),
            ),
            height16,
            Container(
              width: 350,
              height: 180,
              decoration: BoxDecoration(
                  border: Border.all(color: black),
                  color: pureWhite,
                  borderRadius: BorderRadius.circular(40)),
              child: const TextField(
                maxLines: 5,
                maxLength: 250,
                decoration: InputDecoration(
                  counterText: "",
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            height26,
            NameRow(
              rowName: AppLocale.date.getString(context),
            ),
            height16,
            SizedBox(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 150,
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: black),
                        color: pureWhite,
                        borderRadius: BorderRadius.circular(40)),
                  ),
                  Text(AppLocale.to.getString(context),
                      style: const TextStyle(fontSize: 20)),
                  Container(
                    width: 155,
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: black),
                        color: pureWhite,
                        borderRadius: BorderRadius.circular(40)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(AppLocale.from.getString(context),
                        style: const TextStyle(fontSize: 20)),
                  )
                ],
              ),
            ),
            height48,
            NameRow(
              rowName: AppLocale.time.getString(context),
            ),
            height16,
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 150,
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: black),
                        color: pureWhite,
                        borderRadius: BorderRadius.circular(40)),
                  ),
                  Text(AppLocale.to.getString(context),
                      style: const TextStyle(fontSize: 20)),
                  Container(
                    width: 155,
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: black),
                        color: pureWhite,
                        borderRadius: BorderRadius.circular(40)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(AppLocale.from.getString(context),
                        style: const TextStyle(fontSize: 20)),
                  )
                ],
              ),
            ),
            height48,
            NameRow(
              rowName: AppLocale.location.getString(context),
            ),
            height16,
            const TextfieldContainer(),
            height26,
            NameRow(
              rowName: AppLocale.maximumCapacity.getString(context),
            ),
            height16,
            const TextfieldContainer(),
            height70,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 175,
                  height: 60,
                  decoration: BoxDecoration(
                      color: green, borderRadius: BorderRadius.circular(30)),
                  child: TextButton(
                    onPressed: () {
                      context.push(view: BottomNavBarAdmin(), isPush: false);
                    },
                    child: Text(
                      AppLocale.cancel.getString(context),
                      style: TextStyle(
                          color: pureWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 34),
                    ),
                  ),
                ),
                Container(
                  width: 175,
                  height: 60,
                  decoration: BoxDecoration(
                      color: green, borderRadius: BorderRadius.circular(30)),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      AppLocale.addIt.getString(context),
                      style: TextStyle(
                          color: pureWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 34),
                    ),
                  ),
                ),
              ],
            ),
            height16,
          ],
        ),
      ),
    );
  }
}

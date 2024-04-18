import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get_it/get_it.dart';
import 'package:green_saudi_app/extensions/screen_handler.dart';
import 'package:green_saudi_app/localization/localization.dart';
import 'package:green_saudi_app/model/event_model.dart';
import 'package:green_saudi_app/service/supabase_services.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';
import 'package:green_saudi_app/views/Admin/bottom_nav_bar_admin/view/bottom_nav_bar_admin.dart';
import 'package:green_saudi_app/views/Admin/widgets/date_pic.dart';
import 'package:green_saudi_app/views/Admin/widgets/name_of_row.dart';
import 'package:green_saudi_app/views/Admin/widgets/textfiled_container.dart';
import 'package:green_saudi_app/views/Admin/widgets/time_pic.dart';

class AddEvent extends StatelessWidget {
  const AddEvent({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameEventController = TextEditingController();
    TextEditingController descriptionEventController = TextEditingController();
    TextEditingController locationEventController = TextEditingController();
    TimeOfDay startTimeEvent = TimeOfDay.now();
    DateTime startDateEvent = DateTime.now();
    TimeOfDay endTimeEvent = TimeOfDay.now();
    DateTime endDateEvent = DateTime.now();

    TextEditingController capacityEventController = TextEditingController();
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
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextfieldContainer(
                hintText: AppLocale.eventName.getString(context),
                controller: nameEventController,
                keyboardType: TextInputType.text,
              ), //
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
              child: TextField(
                controller: descriptionEventController,
                maxLines: 5,
                maxLength: 250,
                decoration: InputDecoration(
                  hintText: AppLocale.addDescription.getString(context),
                  counterText: "",
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            height26,
            NameRow(
              rowName: AppLocale.date.getString(context),
            ),
            height16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(AppLocale.from.getString(context),
                    style: const TextStyle(fontSize: 20)),
                Text(AppLocale.to.getString(context),
                    style: const TextStyle(fontSize: 20)),
              ],
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Container(
                      width: 150,
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: black),
                          color: pureWhite,
                          borderRadius: BorderRadius.circular(40)),
                      child: const DatePickerWidget(),
                    ),
                  ),
                  Container(
                    width: 155,
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: black),
                        color: pureWhite,
                        borderRadius: BorderRadius.circular(40)),
                    child: const DatePickerWidget(),
                  ),
                ],
              ),
            ),
            height48,
            NameRow(
              rowName: AppLocale.time.getString(context),
            ),
            height16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(AppLocale.from.getString(context),
                    style: const TextStyle(fontSize: 20)),
                Text(AppLocale.to.getString(context),
                    style: const TextStyle(fontSize: 20)),
              ],
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Container(
                      width: 150,
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: black),
                          color: pureWhite,
                          borderRadius: BorderRadius.circular(40)),
                      child: TimePickerWidget(
                        time: startTimeEvent,
                      ),
                    ),
                  ),
                  Container(
                    width: 155,
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: black),
                        color: pureWhite,
                        borderRadius: BorderRadius.circular(40)),
                    child: TimePickerWidget(
                      time: endTimeEvent,
                    ),
                  ),
                ],
              ),
            ),
            height48,
            NameRow(
              rowName: AppLocale.location.getString(context),
            ),
            height16,
            TextfieldContainer(
              hintText: AppLocale.location.getString(context),
              controller: locationEventController,
              keyboardType: TextInputType.text,
            ),
            height26,
            NameRow(
              rowName: AppLocale.maximumCapacity.getString(context),
            ),
            height16,
            TextfieldContainer(
              hintText: AppLocale.maximumCapacity.getString(context),
              controller: capacityEventController,
              keyboardType: TextInputType.number,
            ),
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
                    onPressed: () async {
                      EventModel event = EventModel(
                        title: nameEventController.text,
                        description: descriptionEventController.text,
                        startDate: startDateEvent.toString(),
                        startTime: startTimeEvent.toString(),
                        endDate: endDateEvent.toString(),
                        endTime: endTimeEvent.toString(),
                        location: locationEventController.text,
                        maximumCapacity:
                            int.parse(capacityEventController.text),
                        imageUrl: "assets/images/event.png",
                      );
                      await GetIt.I.get<DBServices>().createEvent(event: event);
                    },
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

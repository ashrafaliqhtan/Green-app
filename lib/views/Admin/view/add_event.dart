import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:green_saudi_app/model/event_model.dart';
import 'package:green_saudi_app/service/supabase_services.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';
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
        TimeOfDay startTimeEvent=TimeOfDay.now();
        DateTime startDateEvent=DateTime.now();
        TimeOfDay endTimeEvent=TimeOfDay.now();
        DateTime endDateEvent=DateTime.now();

    TextEditingController capacityEventController = TextEditingController();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        actionsIconTheme: IconThemeData(color: pureWhite),
        backgroundColor: green,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              " إضافة حدث",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
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
                  const Spacer(),
                  Text("أضف صورة الغلاف",
                      style: TextStyle(
                        fontSize: 24,
                        color: black,
                      )),
                ],
              ),
            ),
            // Second row
            const NameRow(rowName: "إسم الحدث"),
            height16,
             Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: TextfieldContainer(hintText: "إسم الحدث",controller:nameEventController,keyboardType: TextInputType.text,),
            ),
            height26,
            const NameRow(rowName: " أضف وصف الحدث"),
            height16,
            Container(
              width: 350,
              height: 180,
              decoration: BoxDecoration(
                  border: Border.all(color: black),
                  color: pureWhite,
                  borderRadius: BorderRadius.circular(40)),
              child: TextField(controller: descriptionEventController,
                maxLines: 5,
                maxLength: 250,
                decoration: InputDecoration(hintText: " أضف وصف الحدث",
                  counterText: "",
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            height26,
            const NameRow(rowName: "تاريخ الحدث"),
            height16,
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Container(child: DatePickerWidget(),
                      width: 150,
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: black),
                          color: pureWhite,
                          borderRadius: BorderRadius.circular(40)),
                    ),
                  ),
                  const Text("الى", style: TextStyle(fontSize: 20)),
                  Container(child: DatePickerWidget(),
                    width: 155,
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: black),
                        color: pureWhite,
                        borderRadius: BorderRadius.circular(40)),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Text("من", style: TextStyle(fontSize: 24)),
                  )
                ],
              ),
            ),
            height48,
            const NameRow(rowName: "وقت الحدث"),
            height16,
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Container(child: TimePickerWidget(time: startTimeEvent,),
                      width: 150,
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: black),
                          color: pureWhite,
                          borderRadius: BorderRadius.circular(40)),
                    ),
                  ),
                  const Text("الى", style: TextStyle(fontSize: 20)),
                  Container(child: TimePickerWidget(time: endTimeEvent,),
                    width: 155,
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: black),
                        color: pureWhite,
                        borderRadius: BorderRadius.circular(40)),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Text("من", style: TextStyle(fontSize: 24)),
                  )
                ],
              ),
            ),
            height48,
            const NameRow(rowName: "الموقع"),
            height16,
             TextfieldContainer(hintText: "الموقع",controller: locationEventController,keyboardType: TextInputType.text,),
            height26,
            const NameRow(rowName: "القدرة الإستيعابية"),
            height16,
             TextfieldContainer(hintText:"القدرة الإستيعابية" ,controller:capacityEventController ,keyboardType: TextInputType.number,),
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
                    onPressed: () {},
                    child: Text(
                      "إلغاء",
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
                    onPressed: () async{EventModel event = EventModel(
                      title: nameEventController.text,
                      description: descriptionEventController.text,
                      startDate: startDateEvent.toString(),
                      startTime:startTimeEvent.toString(),
                      endDate: endDateEvent.toString(),endTime:endTimeEvent.toString(),
                      location: locationEventController.text,
                      maximumCapacity: int.parse(capacityEventController.text),
                      imageUrl: "assets/images/event.png",
                    );
                    await GetIt.I.get<DBServices>().createEvent(event: event);
                    },
                    child: Text(
                      "إضافة",
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

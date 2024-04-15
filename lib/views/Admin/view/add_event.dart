import 'package:flutter/material.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';
import 'package:green_saudi_app/views/Admin/widgets/name_of_row.dart';
import 'package:green_saudi_app/views/Admin/widgets/textfiled_container.dart';

class AddEvent extends StatelessWidget {
  const AddEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: Navigator.of(context).pop,
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
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
            const NameRow(RowName: "إسم الحدث"),
            height16,
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: TextfiledContainer(),
            ),
            height26,
            const NameRow(RowName: " أضف وصف الحدث"),
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
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                  counterText: "",
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            height26,
            const NameRow(RowName: "تاريخ الحدث"),
            height16,
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    ),
                  ),
                  const Text("الى", style: TextStyle(fontSize: 20)),
                  Container(
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
            const NameRow(RowName: "وقت الحدث"),
            height16,
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    ),
                  ),
                  const Text("الى", style: TextStyle(fontSize: 20)),
                  Container(
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
            const NameRow(RowName: "الموقع"),
            height16,
            const TextfiledContainer(),
            height26,
            const NameRow(RowName: "القدرة الإستيعابية"),
            height16,
            const TextfiledContainer(),
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
                    onPressed: () {},
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



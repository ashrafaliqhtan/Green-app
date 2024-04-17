import 'package:flutter/material.dart';
import 'package:green_saudi_app/extensions/screen_handler.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';
import 'package:green_saudi_app/views/Admin/view/rewards_page.dart';
import 'package:green_saudi_app/views/Admin/widgets/name_of_row.dart';
import 'package:green_saudi_app/views/Admin/widgets/textfiled_container.dart';

class AddReword extends StatelessWidget {
  const AddReword({super.key});
  

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerName=TextEditingController();
        TextEditingController controllerDescription=TextEditingController();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        actionsIconTheme: IconThemeData(color: pureWhite),
        backgroundColor: green,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("أضف صورة الغلاف",
                      style: TextStyle(
                        fontSize: 24,
                        color: black,
                      )),
                      const Spacer(),
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
                ],
              ),
            ),
            // Second row
            const NameRow(rowName: "إسم المكآفأة"),
            height16,
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: TextfieldContainer(hintText: "اسم المكافاة",keyboardType: TextInputType.text,controller:controllerName),
            ),
            height26,
            const NameRow(rowName: " أضف وصف المكآفأة"),
            height16,
            Container(
              width: 350,
              height: 180,
              decoration: BoxDecoration(
                  border: Border.all(color: black),
                  color: pureWhite,
                  borderRadius: BorderRadius.circular(40)),
              child: TextField(keyboardType: TextInputType.text,controller:controllerDescription,
                maxLines: 5,
                maxLength: 250,
                decoration: InputDecoration(hintText: "وصف الكافاة",
                  counterText: "",
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            height26,
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
                      context.push(view:const RewardsPage(), isPush: false);
                    },
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

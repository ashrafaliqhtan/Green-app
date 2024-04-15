import 'package:flutter/material.dart';
import 'package:green_saudi_app/utils/colors.dart';

class SupervisorsPage extends StatelessWidget {
  const SupervisorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: Navigator.of(context).pop,
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: green, // Assuming 'green' is defined in colors.dart
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "المشرفون",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: SizedBox(
        // Wrap ListView.builder with a Container or Expanded
        height: MediaQuery.of(context)
            .size
            .height, // Set height or wrap with Expanded
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 7,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                decoration: BoxDecoration(
                    color: green, borderRadius: BorderRadius.circular(14)),
                height: 60,
                width: 356,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        ' الإسم',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        ' المدينة',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/adminlogo.png"),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

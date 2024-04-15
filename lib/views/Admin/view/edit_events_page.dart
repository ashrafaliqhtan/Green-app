import 'package:flutter/material.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/views/Admin/view/add_event.dart'; // Assuming this is the correct import path
// import 'package:green_saudi_app/utils/spacing.dart'; // Import if necessary

class EditEventsPage extends StatelessWidget {
  const EditEventsPage({super.key});

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddEvent()),
                  );
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                )),
            const Padding(
              padding: EdgeInsets.only(left: 170),
              child: Text(
                "الأحداث",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
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
                        ' العنوان',
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

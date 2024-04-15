import 'package:flutter/material.dart';
import 'package:green_saudi_app/extensions/screen_handler.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/views/Admin/view/add_event.dart';

import '../widgets/reword_container.dart';

class RewardsPage extends StatelessWidget {
  const RewardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        actionsIconTheme: IconThemeData(color: pureWhite),
        backgroundColor: green,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  context.push(view: const AddEvent(), isPush: true);
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                )),
            const Padding(
              padding: EdgeInsets.only(left: 170),
              child: Text(
                "المكافآت",
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
      body: const RewordContainer(),
    );
  }
}


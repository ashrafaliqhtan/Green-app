import 'package:flutter/material.dart';
import 'package:green_saudi_app/extensions/screen_handler.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';
import 'package:green_saudi_app/widgets/event_widget.dart';

class HistoryEventView extends StatelessWidget {
  const HistoryEventView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        leading: IconButton(
          onPressed: () {
            //TODO: Drawer
          },
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/images/logo.jpg'),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: context.getWidth() * .56,
            height: context.getHeight() * .044,
            decoration: BoxDecoration(
                color: pureWhite, borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Text(
                "أحداثي",
                style: TextStyle(
                    color: green, fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          height20,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  return const EventWidget();
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

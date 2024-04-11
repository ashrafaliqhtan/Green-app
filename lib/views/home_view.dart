import 'package:flutter/material.dart';
import 'package:green_saudi_app/extensions/screen_handler.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';
import 'package:green_saudi_app/views/otp_view.dart';
import 'package:green_saudi_app/widgets/slider_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        actions: [
          IconButton(
              onPressed: () {
                context.push(view: OTPView(), isPush: true);
              },
              icon: Image.asset('assets/images/logo.jpg'))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'المبادرات الجارية',
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontSize: 20, color: green, fontWeight: FontWeight.bold),
            ),
          ),
          SliderWidget(),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:green_saudi_app/extensions/screen_handler.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';


class OTPView extends StatelessWidget {
   OTPView({super.key});
  final CountdownController _controller = CountdownController();
   bool isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: green,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            height40,
            Image.asset('assets/images/Data security.png'),
            height40,
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "أدخل رمز التحقق",
                style: TextStyle(color: white, fontSize: 25),
              ),
            ),
            height20,
            OtpTextField(
              numberOfFields: 6,
              showCursor: true,
              margin: EdgeInsets.all(5),
              fieldWidth: context.getWidth() * .1275,
              fieldHeight: context.getHeight() * .075,
              borderColor: pureWhite,
              showFieldAsBox: true,
              fillColor: pureWhite,
              filled: true,
              borderRadius: BorderRadius.circular(20),
              textStyle: TextStyle(fontSize: 25, color: green, fontWeight: FontWeight.bold),
              cursorColor: green,
              focusedBorderColor: pureWhite,
              // clearText: true,
              onCodeChanged: (String code) {
              },
            ),
            height20,
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                TextButton(
                  onPressed: isButtonEnabled
                      ? () {
                          // Your button's onPressed logic here
                          print('');
                        }
                      : null,
                  child: Text('أعد الارسال', style: TextStyle(fontSize: 18, color: pureWhite,),
                  ),
                ),
                 Countdown(
                  seconds: 60,
                  build: (BuildContext context, double time) => Text(
                    'إعادة رمز التحقق بعد ${time.toInt()} ثانية',
                    style: TextStyle(fontSize: 18,color: pureWhite),
                  ),
                  interval: Duration(seconds: 1),
                  onFinished: () {
                    // Set the state to enable the button when countdown finishes
                    (context as Element).markNeedsBuild();
                    isButtonEnabled = true;
                    print('Countdown finished');
                  },
                ),
               ],
             ),
             height40,
             ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: greenDark,
                  minimumSize: Size(context.getWidth(), 50)),
              child: const Text(
                'تحقق',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

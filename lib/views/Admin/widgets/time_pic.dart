import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:green_saudi_app/resources/extensions/screen_handler.dart';
import 'package:green_saudi_app/resources/localization/localization.dart';
import 'package:green_saudi_app/resources/theme/theme.dart';
import 'package:green_saudi_app/resources/utils/colors.dart';

// ignore: must_be_immutable
class TimePickerWidget extends StatefulWidget {
  TimePickerWidget({required this.time, super.key});
  late TimeOfDay time;

  @override
  TimePickerWidgetState createState() => TimePickerWidgetState();
}

class TimePickerWidgetState extends State<TimePickerWidget> {
  late TimeOfDay selectedTime;

  @override
  void initState() {
    super.initState();
    selectedTime = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectTime(context);
      },
      child: Container(
        width: context.getWidth(),
        height: 48,
        decoration: const BoxDecoration(
          borderRadius:  BorderRadius.all(Radius.circular(14)),
        ),
        child: Row(
          children: [
            const SizedBox(width: 8),
            Text(
              selectedTime.format(context),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final ThemeData theme = Theme.of(context);
    final TimeOfDay? picked = await showTimePicker(
      cancelText: AppLocale.cancel.getString(context),
      confirmText: AppLocale.ok.getString(context),
      initialTime: selectedTime,
      context: context,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: theme.copyWith(
            timePickerTheme: customTimePicker(),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
        widget.time = selectedTime;
      });
    }
  }
}

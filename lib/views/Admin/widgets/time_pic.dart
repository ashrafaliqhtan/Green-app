import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get_it/get_it.dart';
import 'package:green_saudi_app/resources/extensions/screen_handler.dart';
import 'package:green_saudi_app/resources/localization/localization.dart';
import 'package:green_saudi_app/resources/theme/theme.dart';
import 'package:green_saudi_app/service/supabase_services.dart';

// ignore: must_be_immutable
class TimePickerWidget extends StatefulWidget {
  TimePickerWidget({required this.time, required this.isFires, super.key});
  String time;
  bool isFires;

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
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        child: Row(
          children: [
            const SizedBox(width: 8),
            Text(
              selectedTime.format(context),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
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
        String formatDateTime(TimeOfDay date) {
  return date.format(context);
}
        selectedTime = picked;
        widget.time = formatDateTime(selectedTime);
        if(widget.isFires){

          GetIt.I.get<DBServices>().startTimeEvent=selectedTime.toString();
        }
        else{
          GetIt.I.get<DBServices>().endTimeEvent=selectedTime.toString();
        }
        print(widget.time);
      });
    }
  }
}

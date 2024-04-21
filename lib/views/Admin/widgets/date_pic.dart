import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends StatelessWidget {
  const DatePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return TextField(
      controller: controller,
      
      decoration: const InputDecoration(
        // fillColor: Theme.of(context).primaryColor,
        border:  OutlineInputBorder(borderSide: BorderSide.none),
        hintText: "Enter date",
        
      ),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2101),
        );
        if (pickedDate != null) {
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          controller.text = formattedDate;
        } else {
          print("Date is not selected");
        }
      },
    );
  }
}

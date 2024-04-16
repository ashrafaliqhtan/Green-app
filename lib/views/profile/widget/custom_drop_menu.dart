import 'package:flutter/material.dart';

class DropMenu extends StatefulWidget {
  const DropMenu({
    super.key,
  });
  @override
  _DropMenuState createState() => _DropMenuState();
}

class _DropMenuState extends State<DropMenu> {
  String selectedValue = "الشرقية";

  List<String> listCity = [
    "الشرقية",
    "الرياض",
    "مكة المكرمة",
    "المدينة المنورة",
    "القصيم",
    "عسير",
    "تبوك",
    "حائل",
    "الحدود الشمالية",
    "نجران",
    "الباحة",
    "الجوف"
  ];
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      value: selectedValue,
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue!;
        });
      },
      items: listCity.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

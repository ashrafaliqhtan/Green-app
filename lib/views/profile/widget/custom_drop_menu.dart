import 'package:flutter/material.dart';
import 'package:green_saudi_app/data_layer/data_layer.dart';
import 'package:green_saudi_app/service/supabase_services.dart';

class DropMenu extends StatefulWidget {
  const DropMenu({
    super.key,
  });
  @override
  _DropMenuState createState() => _DropMenuState();
}

class _DropMenuState extends State<DropMenu> {
  final serviceLocator = DataInjection().locator.get<DBServices>();

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
    final user = serviceLocator.user;

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
        fillColor: Theme.of(context).primaryColor,
      ),
      value: user.city,
      onChanged: (newValue) {
        setState(() {
          user.city = newValue;
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

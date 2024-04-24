import 'package:flutter/material.dart';
import 'package:green_saudi_app/locators/data_injection.dart';
import 'package:green_saudi_app/service/database_configuration.dart';
import 'package:green_saudi_app/service/supabase_services.dart';

class DropMenu extends StatefulWidget {
  const DropMenu({
    super.key,
  });
  @override
  DropMenuState createState() => DropMenuState();
}

class DropMenuState extends State<DropMenu> {
  @override
  Widget build(BuildContext context) {
    final user = DataInjection().locator.get<DBServices>().user;

    List<String> listCityDropMenu = [
      'Eastern -الشرقية',
      'Riyadh  - الرياض',
      'Makkah - مكة المكرمة',
      'Al-Madinah - المدينة',
      'Al-Qassim - القصيم',
      'Asir - عسير',
      'Tabuk - تبوك',
      'Hail - حائل',
      'Northern - الشمالية',
      'Najran - نجران',
      'Al-Baha - الباحة',
      'Al-Jawf - الجوف',
      'Jazan - جازان',
    ];

    return FutureBuilder(
      future: Future(() => translatorFunction(user.city ?? "لايوجد محتوى")),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {}
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
          items: listCityDropMenu.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        );
      },
    );
  }
}

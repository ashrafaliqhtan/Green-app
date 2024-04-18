import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:green_saudi_app/localization/localization.dart';

class DropMenu extends StatefulWidget {
  const DropMenu({
    super.key,
  });
  @override
  DropMenuState createState() => DropMenuState();
}

class DropMenuState extends State<DropMenu> {
  String selectedValue = "الشرقية";


  @override
  Widget build(BuildContext context) {
      List<String> listCity = [
   AppLocale.region1.getString(context),
      AppLocale.region2.getString(context),
      AppLocale.region3.getString(context),
      AppLocale.region4.getString(context),
      AppLocale.region5.getString(context),
      AppLocale.region6.getString(context),
      AppLocale.region7.getString(context),
      AppLocale.region8.getString(context),
      AppLocale.region9.getString(context),
      AppLocale.region10.getString(context),
      AppLocale.region11.getString(context),
      AppLocale.region12.getString(context),
      AppLocale.region13.getString(context),
  ];
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

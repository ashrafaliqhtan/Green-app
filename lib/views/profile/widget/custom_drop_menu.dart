import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:green_saudi_app/locators/data_injection.dart';
import 'package:green_saudi_app/resources/localization/localization.dart';
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
          items: listCity.map<DropdownMenuItem<String>>((String value) {
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

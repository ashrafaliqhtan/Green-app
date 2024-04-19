import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_saudi_app/extensions/screen_handler.dart';
import 'package:green_saudi_app/localization/localization.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';
import 'package:green_saudi_app/views/Drawer/view/drawer_view.dart';
import 'package:green_saudi_app/widgets/event_widget.dart';
import 'package:green_saudi_app/widgets/regions_widget.dart';

class EventView extends StatelessWidget {
  const EventView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    // All 13 Regions
    final List<String> regionsList = [
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          AppLocale.upComingEvent.getString(context),
          style: TextStyle(
              color: green, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/logo.jpg'),
            ),
          ),
        ],
      ),
      drawer: const DrawerScreen(),
      body: Column(
        children: [
          height10,
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    // textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      fillColor: Theme.of(context).scaffoldBackgroundColor,
                      filled: true,
                      hintText:   AppLocale.hintSearch.getString(context),
                      // hintTextDirection: TextDirection.rtl,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SvgPicture.asset(
                          'assets/icons/Group172.svg',
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 30),
                      prefixIconConstraints:
                          const BoxConstraints(maxHeight: 54, maxWidth: 54),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: green),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: green),
                      ),
                    ),
                  ),
                ),
                width16,
                Container(
                  width: 68,
                  height: 58,
                  decoration: BoxDecoration(
                      color: green, borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/search.svg',
                      color: white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Regions ListView
          SizedBox(
            width: context.getWidth(),
            height: context.getHeight() * .044,
            child: ListView.builder(
                itemCount: 13,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return RegionsWidget(
                    text: regionsList[index],
                  );
                }),
          ),
          height32,
          // Event ListView
          Expanded(
            child: ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const EventWidget();
                }),
          ),
        ],
      ),
    );
  }
}

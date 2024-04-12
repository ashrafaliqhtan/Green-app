import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_saudi_app/extensions/screen_handler.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';
import 'package:green_saudi_app/widgets/event_widget.dart';
import 'package:green_saudi_app/widgets/regions_widget.dart';

class EventView extends StatelessWidget {
  EventView({super.key});
  final TextEditingController controller = TextEditingController();
  final List<String> regionsList = [
    'الرياض',
    'مكة المكرمة',
    'حائل',
    'الباحة',
    'جازان',
    'نجران',
    'الشرقية',
    'الجوف',
    'الحدود الشمالية',
    'عسير',
    'تبوك',
    'المدينة المنورة',
    'القصيم',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
        title: Text(
          "الاحداث القادمة",
          style: TextStyle(
              color: green, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/images/logo.jpg'),
          ),
        ],
      ),
      body: Column(
        children: [
          height10,
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  width: 68,
                  height: 58,
                  decoration: BoxDecoration(
                      color: pureWhite,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/search.svg',
                    ),
                  ),
                ),
                width16,
                Expanded(
                  child: TextField(
                    controller: controller,
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      fillColor: pureWhite,
                      filled: true,
                      hintText: "أكتشف أهم الأحداث",
                      hintTextDirection: TextDirection.rtl,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SvgPicture.asset(
                          'assets/icons/Group172.svg',
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 30),
                      suffixIconConstraints:
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
              ],
            ),
          ),
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return EventWidget();
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

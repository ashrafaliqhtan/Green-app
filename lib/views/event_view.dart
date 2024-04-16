import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_saudi_app/extensions/screen_handler.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            //TODO: Drawer
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
      drawer: const DrawerScreen(),
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
                      color: green, borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/search.svg',
                      color: white,
                    ),
                  ),
                ),
                width16,
                Expanded(
                  child: TextField(
                    controller: controller,
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      fillColor: Theme.of(context).scaffoldBackgroundColor,
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
            child: Scrollbar(
              thickness: 7,
              child: ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return const EventWidget();
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

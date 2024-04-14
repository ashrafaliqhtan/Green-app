import 'package:flutter/material.dart';
import 'package:green_saudi_app/extensions/screen_handler.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';
import 'package:green_saudi_app/widgets/header_point_widget.dart';
import 'package:green_saudi_app/widgets/history_point_widget.dart';

class RewardView extends StatelessWidget {
  const RewardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        backgroundColor: white,
        appBar: PreferredSize(
          preferredSize: Size(context.getWidth(), context.getHeight() / 2.7),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        //TODO: Drawer
                      },
                      icon: const Icon(Icons.menu),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/images/logo.jpg'),
                    ),
                  ],
                ),
                // Point Container
                const HeaderPoint(),
                height10,
                TabBar(
                  labelColor: green,
                  indicatorColor: green,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 3,
                  labelStyle: const TextStyle(fontSize: 20),
                  unselectedLabelColor: black,
                  tabs: const [
                    Tab(text: 'تاريخ النقاط'),
                    Tab(text: 'العروض'),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  // History Point
                  Scrollbar(
                    thickness: 4,
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return PointWidget();
                        }),
                  ),
                  // Offers
                  const Center(
                    child: Text('العروض'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

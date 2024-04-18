import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:green_saudi_app/extensions/screen_handler.dart';
import 'package:green_saudi_app/localization/localization.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';
import 'package:green_saudi_app/widgets/header_point_widget.dart';
import 'package:green_saudi_app/widgets/history_point_widget.dart';
import 'package:green_saudi_app/widgets/offers_widget.dart';

class RewardView extends StatelessWidget {
  const RewardView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: PreferredSize(
          preferredSize: Size(context.getWidth(), context.getHeight() / 3.2),
          child: SafeArea(
            child: Column(
              children: [
                height32,
                // Point Container
                const HeaderPoint(),
                height10,
                TabBar(
                  labelColor: green,
                  indicatorColor: green,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 3,
                  labelStyle: const TextStyle(fontSize: 20),
                  unselectedLabelColor: Theme.of(context).unselectedWidgetColor,
                  tabs: [
                    Tab(text: AppLocale.offers.getString(context)),
                    Tab(text: AppLocale.historyPoint.getString(context)),
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
                  // Offers
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 5,
                      childAspectRatio: 1,
                    ),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return OfferWidget();
                    },
                  ),
                  // History Point
                  ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return PointWidget();
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

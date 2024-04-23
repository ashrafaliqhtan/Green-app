import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:green_saudi_app/resources/extensions/screen_handler.dart';
import 'package:green_saudi_app/resources/localization/localization.dart';
import 'package:green_saudi_app/resources/utils/colors.dart';
import 'package:green_saudi_app/resources/utils/spacing.dart';
import 'package:green_saudi_app/views/Admin/bloc/reward_bloc.dart';
import 'package:green_saudi_app/widgets/header_point_widget.dart';
import 'package:green_saudi_app/widgets/history_point_widget.dart';
import 'package:green_saudi_app/widgets/offers_widget.dart';
import 'package:green_saudi_app/widgets/shimmer_point_widget.dart';
import 'package:green_saudi_app/widgets/shimmer_widget.dart';

class RewardView extends StatelessWidget {
  const RewardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RewardBloc()..add(RewardLoadEvent()),
      child: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: PreferredSize(
            preferredSize: Size(context.getWidth(), context.getHeight() / 3.2),
            child: SafeArea(
              child: Column(
                children: [
                  height32,
                  // Point Container
                  BlocBuilder<RewardBloc, RewardState>(
                    builder: (context, state) {
                      if (state is RewardLoadingState) {
                        return shimmerEffectPoint();
                      } else if (state is RewardLoadedState) {
                        return HeaderPoint(
                          totalHours: state.point,
                        );
                      }
                      return const HeaderPoint(
                        totalHours: 0,
                      );
                    },
                  ),
                  height10,
                  TabBar(
                    labelColor: green,
                    indicatorColor: green,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 3,
                    labelStyle: const TextStyle(fontSize: 20),
                    unselectedLabelColor:
                        Theme.of(context).unselectedWidgetColor,
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
                    BlocBuilder<RewardBloc, RewardState>(
                      builder: (context, state) {
                        if (state is RewardLoadingState) {
                          return ListView.builder(
                              itemCount: 4,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return buildShimmerEffect();
                              });
                        } else if (state is RewardLoadedState) {
                          return GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 5,
                              childAspectRatio: 0.78,
                            ),
                            itemCount: state.list.length,
                            itemBuilder: (context, index) {
                              return OfferWidget(
                                reward: state.list[index],
                              );
                            },
                          );
                        } else {
                          return Center(
                            child: Text(
                              AppLocale.noReward.getString(context),style: TextStyle(color: green, fontSize: 25),
                            ),
                          );
                        }
                      },
                    ),
                    // History Point
                    BlocBuilder<RewardBloc, RewardState>(
                      builder: (context, state) {
                        if (state is RewardLoadedState) {
                          return ListView.builder(
                              itemCount: state.historyPoints.length,
                              itemBuilder: (context, index) {
                                return PointWidget(
                                  points: state.historyPoints[index],
                                );
                              });
                        }
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/Insert block-rafiki.svg",
                                height: 200,
                              ),
                              height16,
                              Text(
                                AppLocale.noHistory.getString(context),
                                style: TextStyle(fontSize: 30, color: green),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:green_saudi_app/resources/extensions/screen_handler.dart';
import 'package:green_saudi_app/resources/localization/localization.dart';
import 'package:green_saudi_app/resources/utils/colors.dart';
import 'package:green_saudi_app/resources/utils/spacing.dart';
import 'package:green_saudi_app/views/Admin/bottom_nav_bar_admin/view/bottom_nav_bar_admin.dart';
import 'package:green_saudi_app/views/Admin/view/add_reword.dart';
import 'package:green_saudi_app/views/Admin/view/bloc/reward_bloc.dart';
import 'package:green_saudi_app/widgets/offers_widget.dart';
// import 'package:green_saudi_app/widgets/offers_widget.dart';

class RewardsAdminPage extends StatelessWidget {
  const RewardsAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RewardBloc()..add(RewardLoadEvent()),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                context.push(view: BottomNavBarAdmin(), isPush: false);
              },
              icon: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
          ],
          backgroundColor: green,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                AppLocale.rewordAdmin.getString(context),
                style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
        body: BlocBuilder<RewardBloc, RewardState>(
          builder: (context, state) {
            if (state is RewardLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is RewardLoadedState) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 5,
                  childAspectRatio: 1,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/icons/Insert block-rafiki.svg"),
                    height16,
                    Text(
                      'No Reward added',
                      style: TextStyle(fontSize: 30, color: green),
                    )
                  ],
                ),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.push(view: const AddReword(), isPush: false);
          },
          backgroundColor: green, // Set your desired background color
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

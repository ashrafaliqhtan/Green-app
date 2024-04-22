import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_saudi_app/model/reward_model.dart';
import 'package:green_saudi_app/resources/extensions/screen_handler.dart';
import 'package:green_saudi_app/resources/utils/colors.dart';
import 'package:green_saudi_app/resources/utils/spacing.dart';
import 'package:green_saudi_app/views/Admin/bloc/reward_bloc.dart';
import 'package:green_saudi_app/widgets/shimmer_point_widget.dart';

class DetailsOfferView extends StatelessWidget {
  const DetailsOfferView({super.key, required this.reward});
  final RewardModel reward;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: green,
            ),
            onPressed: () {
              context.read<RewardBloc>().add(RewardLoadEvent());
              Navigator.pop(context);
            },
          ),
        ),
        body: BlocConsumer<RewardBloc, RewardState>(
          listener: (context, state) {
            if (state is RewardPointSuccessState) {
              context.getMessagesBar(
                  msg: state.msg, color: green, success: true);
            } else if (state is RewardPointErrorState) {
              context.getMessagesBar(
                  msg: state.msg, color: red, success: false);
            }
          },
          builder: (context, state) {
            if (state is RewardLoadingState) {
              return shimmerEffectPoint();
            }
            return SafeArea(
              child: SingleChildScrollView(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      height16,
                      // Image
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              reward.rewardCompanyLogo!,
                            ),
                          ),
                        ),
                      ),
                      // Title
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          reward.rewardCompanyName ?? "",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Divider
                      Divider(
                        height: 2,
                        thickness: 2,
                        color: Colors.grey[300],
                        indent: 16,
                        endIndent: 16,
                      ),
                      // Description
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          reward.rewardContent ?? "content",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: ElevatedButton(
                            onPressed: () {
                              //TODO: Register in Event for user
                              context
                                  .read<RewardBloc>()
                                  .add(RewardRedeemPoint());
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Container(
                              height: 60,
                              alignment: Alignment.center,
                              child: Text(
                                "Reedem",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}

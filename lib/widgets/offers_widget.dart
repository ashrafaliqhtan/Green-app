import 'package:flutter/material.dart';
import 'package:green_saudi_app/model/reward_model.dart';
import 'package:green_saudi_app/resources/extensions/screen_handler.dart';
import 'package:green_saudi_app/resources/utils/colors.dart';
import 'package:green_saudi_app/resources/utils/spacing.dart';

import '../views/deatils_offer_view.dart';

class OfferWidget extends StatelessWidget {
  const OfferWidget({super.key, required this.reward});
  final RewardModel reward;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          context.push(
              view: DetailsOfferView(
                reward: reward,
              ),
              isPush: true);
        },
        child: Card(
          clipBehavior: Clip.antiAlias,
          color: pureWhite,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            alignment: Alignment.center,
            color: pureWhite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(10)),
                    //TODO: Reward img
                    child: Image.network(
                          reward.rewardCompanyLogo!,
                          height: 100,
                          width: context.getWidth(),
                      fit: BoxFit.fill,
                    )),
                height10,
                Divider(
                  height: 3,
                  thickness: 4,
                  color: green,
                ),
                height10,
                Text(
                  reward.rewardCompanyName ?? "company",
                  style: TextStyle(
                    fontSize: 18,
                    color: black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

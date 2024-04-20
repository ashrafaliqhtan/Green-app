import 'package:flutter/material.dart';
import 'package:green_saudi_app/model/reward_model.dart';
import 'package:green_saudi_app/resources/utils/colors.dart';
import 'package:green_saudi_app/resources/utils/spacing.dart';

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
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
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
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      //TODO: fix Reward img
                      image: AssetImage(
                        'assets/images/HalfMillionLogo-Black-croppped-extras.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Title
                 Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    reward.rewardCompanyName ?? "",
                    style: TextStyle(
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
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    reward.rewardContent ?? "content",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

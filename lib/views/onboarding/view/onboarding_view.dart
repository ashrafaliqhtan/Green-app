import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:green_saudi_app/extensions/screen_handler.dart';
import 'package:green_saudi_app/localistion/localistion.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';
import 'package:green_saudi_app/views/bottom_nav_bar/view/bottom_nav_bar.dart';
import 'package:green_saudi_app/views/onboarding/bloc/onboarding_bloc.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingBloc(),
      child: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          final onboardingBloc = BlocProvider.of<OnboardingBloc>(context);

          // ** Preload all images for smooth transaction ** \\
          for (final item in onboardingBloc.items) {
            precacheImage(AssetImage(item.image), context);
          }
          return Scaffold(
            body: PageView.builder(
              onPageChanged: (index) {
                if (state is! OnboardingLoadedState) {
                  onboardingBloc.add(NextViewEvent());
                }
              },
              itemCount: onboardingBloc.items.length,
              itemBuilder: (context, index) {
                final currentIndex =
                    state is OnboardingLoadedState ? state.currentIndex : 0;
                return Container(
                  width: context.getWidth(),
                  height: context.getHeight(),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage(onboardingBloc.items[currentIndex].image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: context.getWidth() * .3,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.transparent,
                                border: Border.all(width: 2, color: grey),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  context.push(
                                      view: BottomNavBar(), isPush: false);
                                },
                                child: Text(
                                  AppLocale.skip.getString(context),
                                  style: TextStyle(color: white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      height100,
                      //Titles
                      Text(
                        onboardingBloc.items[currentIndex].title,
                        style: TextStyle(
                          fontSize: 25,
                          color: green,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      height100,
                      //Description
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: SizedBox(
                          width: context.getWidth(),
                          height: context.getHeight() * .16,
                          child: Text(
                            onboardingBloc.items[currentIndex].description,
                            style: TextStyle(color: grey, fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      height100,
                      // dots
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          onboardingBloc.items.length,
                          (index) => AnimatedContainer(
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: currentIndex == index ? green : grey,
                            ),
                            height: 7,
                            width: currentIndex == index ? 30 : 7,
                            duration: const Duration(milliseconds: 1000),
                          ),
                        )
                      ),
                      height40,
                      // button
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        width: context.getWidth() * .9,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: green,
                        ),
                        child: TextButton(
                          onPressed: () {
                            if (currentIndex ==
                                onboardingBloc.items.length - 1) {
                              context.push(view: BottomNavBar(), isPush: false);
                            } else {
                              onboardingBloc.add(NextViewEvent());
                            }
                          },
                          child: Text(
                            currentIndex == onboardingBloc.items.length - 1
                                ? AppLocale.start.getString(context)
                                : AppLocale.move.getString(context),
                            style: TextStyle(color: pureWhite, fontSize: 24),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

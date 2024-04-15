import 'package:flutter/material.dart';
import 'package:green_saudi_app/extensions/screen_handler.dart';
import 'package:green_saudi_app/model/onboarding_model.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';
import 'package:green_saudi_app/views/bottom_nav_bar/view/bottom_nav_bar.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final pageController = PageController();
  int currentIndex = 0;
    List<Onboarding> items = [
    Onboarding(
        title: "تشجير المملكة العربية السعودية",
        description:
            "مهمة تسريع رحلة الانتقال الأخضر للمملكة العربية السعودية والحد من تداعيات تغير المناخ."
            "تلتزم المبادرة بإعادة تأهيل 40 مليون هكتار من الأراضي واستعادة المساحات الخضراء الطبيعية في المملكة العربية السعودية.",
        image:
            "assets/images/354624_Saudi green with many trees  _xl-1024-v1-0.png"),
    Onboarding(
        title: "تقليل الانبعاثات الكربونية",
        description:
            "مهمة تسريع رحلة الانتقال الأخضر للمملكة العربية السعودية والحد من تداعيات تغير المناخ.",
        image: "assets/images/emission-target.jpg"),
    Onboarding(
        title: "حماية المناطق البرية والبحرية",
        description:
            "توفير الموائل الطبيعية الضرورية للعديد من الأنواع النباتية والحيوانية، مع ضمان الازدهار المستمر للبشرية دون أي تعارض مع الطبيعة أو التأثير عليها.",
        image: "assets/images/ef57f528-4fd4-409a-8473-ee471d0a4fc9.png"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          onPageChanged: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Container(
              width: context.getWidth(),
              height: context.getHeight(),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(items[currentIndex].image),
                      fit: BoxFit.cover)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: context.getWidth() * .3,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.transparent, border: Border.all(width: 2,color: grey)),
                          child: TextButton(
                            onPressed: () {
                              context.push(view: BottomNavBar(), isPush: false);
                            },
                            child: Text(
                              "تخطي",
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
                    items[currentIndex].title,
                    style: TextStyle(
                        fontSize: 25,
                        color: green,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  height100,
                  //Description
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      items[currentIndex].description,
                      style:
                           TextStyle(color: grey, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  height100,
                  // dots
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        items.length,
                        (index) => AnimatedContainer(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: currentIndex == index
                                  ? green
                                  : grey,
                            ),
                            height: 7,
                            width: currentIndex == index ? 30 : 7,
                            duration: const Duration(milliseconds: 1000))),
                  ),
                  height40,
                  // button
                  (currentIndex == items.length - 1)
                      ? Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    width: context.getWidth() * .9,
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: green),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          currentIndex != items.length - 1
                              ? currentIndex++
                              : context.push(view: BottomNavBar(), isPush: false);
                        });
                      },
                      child: Text(
       
                             "لنبدأ",
                           
                        style: TextStyle(color: pureWhite,fontSize: 24),
                      ),
                    ),
                  ) : const SizedBox(),
                ],
              ),
            );
          }),
    );
  }
}

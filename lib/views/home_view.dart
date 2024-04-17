import 'package:flutter/material.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';
import 'package:green_saudi_app/views/Drawer/view/drawer_view.dart';
import 'package:green_saudi_app/widgets/golas_widget.dart';
import 'package:green_saudi_app/widgets/slider_widget.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/logo.jpg'),
            ),
          ),
        ],
      ),
      drawer: const DrawerScreen(),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'المبادرات الجارية',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 20,
                    color: green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SliderWidget(),
              height20,
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/about-sgi-bg-web.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: AnimateList(
                    interval: 400.ms,
                    effects: [FadeEffect(duration: 300.ms)],
                    children: [
                      Divider(
                        color: green,
                        height: 0,
                        thickness: 4,
                      ),
                      height100,
                      height100,
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "أهداف المبادرة",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 30,
                            color: green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const GoalsWidget(
                        img: 'assets/images/one-removebg-preview.png',
                        text:
                            'الإشراف على جميع جهود المملكة وتوحيدها لمكافحة تغير المناخ تحت مظلة واحدة وفق أهداف واضحة',
                      ),
                      const GoalsWidget(
                        img: 'assets/images/spinner-removebg-preview.png',
                        text:
                            'توحيد جهود القطاعين الحكومي والخاص لتحديد ودعم فرص التعاون والابتكار',
                      ),
                      const GoalsWidget(
                        img: 'assets/images/Growth-removebg-preview.png',
                        text:
                            'تعزيز الاقتصاد الأخضر – تم إطلاق أكثر من 80 مبادرة تمثل استثماراً مهماً تتجاوز قيمته 705 مليار ريال سعودي',
                      ),
                      const GoalsWidget(
                        img: 'assets/images/Plant-removebg-preview.png',
                        text:
                            'تسريع الانتقال الأخضر والاضطلاع بدور رائد عالمياً في تطبيق نموذج الاقتصاد الدائري للكربون',
                      ),
                      const GoalsWidget(
                        img:
                            'assets/images/Screenshot_2024-04-11_224327-removebg-preview.png',
                        text:
                            'رفع مستوى جودة الحياة وحماية البيئة للأجيال القادمة في المملكة العربية السعودية',
                        isDivider: false,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

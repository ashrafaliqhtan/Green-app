import 'package:flutter/material.dart';
import 'package:green_saudi_app/extensions/screen_handler.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';
import 'package:green_saudi_app/views/otp_view.dart';
import 'package:green_saudi_app/widgets/golas_widget.dart';
import 'package:green_saudi_app/widgets/slider_widget.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.push(view: OTPView(), isPush: true);
            },
            icon: Image.asset('assets/images/logo.jpg'),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: green, // Customize drawer header background color
              ),
              child: const Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white, // Customize drawer header text color
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Option 1'),
              onTap: () {
                // Handle option 1 tap
              },
            ),
            const Divider(
              height: 4,
              thickness: 0.3,
            ),
            ListTile(
              title: const Text('Option 2'),
              onTap: () {
                // Handle option 2 tap
              },
            ),
          ],
        ),
      ),
      body: Scrollbar(
        thickness: 3,
        child: ListView(
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
                        Text(
                          "أهداف المبادرة",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 30,
                            color: green,
                            fontWeight: FontWeight.bold,
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
      ),
    );
  }
}

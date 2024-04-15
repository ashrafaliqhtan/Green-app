import 'package:flutter/material.dart';
import 'package:green_saudi_app/extensions/screen_handler.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';
import 'package:green_saudi_app/views/Admin/view/edit_events_page.dart';
import 'package:green_saudi_app/views/Admin/view/rewards_page.dart';
import 'package:green_saudi_app/views/Admin/view/supervisors_page.dart';
import 'package:green_saudi_app/views/Admin/widgets/admin_panel.dart';

class ControlPanel extends StatelessWidget {
  const ControlPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "لوحة التحكم",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
      backgroundColor: greyLight,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AdminPanel(
            address: 'تعديل الأحداث',
            panelIcon: 'assets/icons/adminedit.svg',
            onTap: () {
              context.push(view: const EditEventsPage(), isPush: true);
            },
          ),
          height16,
          AdminPanel(
            address: 'المشرفون',
            panelIcon: 'assets/icons/adminsupervisor.svg',
            onTap: () {
              context.push(view: const SupervisorsPage(), isPush: true);
            },
          ),
          height16,
          AdminPanel(
            address: 'المكافآت',
            panelIcon: 'assets/icons/adminreword.svg',
            onTap: () {
              context.push(view: const RewardsPage(), isPush: true);
            },
          ),
        ],
      ),
    );
  }
}

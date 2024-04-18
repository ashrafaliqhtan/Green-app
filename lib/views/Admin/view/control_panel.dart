import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:green_saudi_app/extensions/screen_handler.dart';
import 'package:green_saudi_app/localization/localization.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';
import 'package:green_saudi_app/views/Admin/view/edit_events_page.dart';
import 'package:green_saudi_app/views/Admin/view/rewards_page.dart';
import 'package:green_saudi_app/views/Admin/view/supervisors_page.dart';
import 'package:green_saudi_app/views/Admin/widgets/admin_panel.dart';
import 'package:green_saudi_app/views/Authentication/bloc/auth_bloc.dart';
import 'package:green_saudi_app/views/Authentication/view/login_view.dart';
import 'package:green_saudi_app/views/bottom_nav_bar/view/bottom_nav_bar.dart';

class ControlPanel extends StatelessWidget {
  const ControlPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
      actions: [
        IconButton(onPressed: (){
          context.read<AuthBloc>().add(LogoutEvent());
                context.push(view: const LoginView(), isPush: false);
              }, icon: const Icon(Icons.logout,color: Colors.white,),
              
              ),
              IconButton(onPressed: (){
            context.push(view: BottomNavBar(), isPush: false);
          }, icon: const Icon(Icons.remove_red_eye_outlined,color: Colors.white,),),
      ],
        
        backgroundColor: green,
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              AppLocale.controlPanel.getString(context),
              style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AdminPanel(
            address: AppLocale.eventsAdmin.getString(context),
            panelIcon: 'assets/icons/adminedit.svg',
            onTap: () {
              context.push(view: const EditEventsPage(), isPush: false);
            },
          ),
          height16,
          AdminPanel(
            address: AppLocale.supervisors.getString(context),
            panelIcon: 'assets/icons/adminsupervisor.svg',
            onTap: () {
              context.push(view: const SupervisorsPage(), isPush: false);
            },
          ),
          height16,
          AdminPanel(
            address: AppLocale.rewardsPageAdmin.getString(context),
            panelIcon: 'assets/icons/adminreword.svg',
            onTap: () {
              context.push(view: const RewardsPage(), isPush: false);
            },
          ),
        ],
      ),
    );
  }
}

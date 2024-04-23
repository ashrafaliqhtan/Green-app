import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:green_saudi_app/resources/extensions/screen_handler.dart';
import 'package:green_saudi_app/resources/localization/localization.dart';
import 'package:green_saudi_app/resources/utils/colors.dart';
import 'package:green_saudi_app/resources/utils/spacing.dart';
import 'package:green_saudi_app/views/Admin/view/events_admin_page.dart';
import 'package:green_saudi_app/views/Admin/view/rewards_admin_page.dart';
import 'package:green_saudi_app/views/Admin/view/supervisors_page.dart';
import 'package:green_saudi_app/views/Admin/widgets/admin_panel.dart';
import 'package:green_saudi_app/views/Authentication/bloc/auth_bloc.dart';
import 'package:green_saudi_app/views/Authentication/view/login_view.dart';
import 'package:green_saudi_app/views/bottom_nav_bar/view/bottom_nav_bar.dart';

class ControlPanel extends StatelessWidget {
  const ControlPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:const BoxDecoration(
        image:DecorationImage(image: AssetImage('assets/images/Environmentadmin.png'),
      fit: BoxFit.cover,)
         
        
      ) ,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            context.read<AuthBloc>().add(LogoutEvent());
                  context.push(view: const LoginView(), isPush: false);
                }, icon: const Icon(Icons.logout,color: Colors.white,),
                
                ),
                IconButton(onPressed: (){
              context.push(view: const BottomNavBar(), isPush: false);
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
        
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AdminPanel(
              address: AppLocale.eventsAdmin.getString(context),
              panelIcon: 'assets/icons/adminedit.svg',
              onTap: () {
                context.push(view: const EventsAdminPage(), isPush: false);
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
                context.push(view: const RewardsAdminPage(), isPush: false);
              },
            ),
          ],
        ),
      ),
    );
  }
}

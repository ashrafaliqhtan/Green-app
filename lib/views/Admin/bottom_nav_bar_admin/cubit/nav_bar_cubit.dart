import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_saudi_app/views/Admin/view/control_panel.dart';
import 'package:green_saudi_app/views/Admin/view/edit_events_page.dart';
import 'package:green_saudi_app/views/Admin/view/rewards_page.dart';
import 'package:green_saudi_app/views/Admin/view/supervisors_page.dart';


part 'nav_bar_state.dart';

class NavBarAdminCubit extends Cubit<NavBarAdminState> {
  List<Widget> pages = <Widget>[
     const ControlPanel(),
    const EditEventsPage(),
    const RewardsPage(),
    const SupervisorsPage(),
  ];

  int selectIndex = 0;
  NavBarAdminCubit() : super(NavBarAdminInitial());

  void changeNavItem(int index) {
    selectIndex = index;
    emit(SuccessChangeIndex());
  }
}

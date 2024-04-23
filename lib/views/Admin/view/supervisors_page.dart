import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:green_saudi_app/resources/extensions/screen_handler.dart';
import 'package:green_saudi_app/resources/localization/localization.dart';
import 'package:green_saudi_app/resources/utils/colors.dart';
import 'package:green_saudi_app/views/Admin/bottom_nav_bar_admin/view/bottom_nav_bar_admin.dart';
import 'package:green_saudi_app/views/Supervisor/bloc/supervisor_bloc.dart';

class SupervisorsPage extends StatelessWidget {
  const SupervisorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SupervisorBloc()..add(LoadSupervisors()),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                context.push(view: BottomNavBarAdmin(), isPush: false);
              },
              icon: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
          ],
          backgroundColor: green,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                AppLocale.supervisors.getString(context),
                style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
        body: SizedBox(
          height: context.getHeight(),
          child: BlocBuilder<SupervisorBloc, SupervisorState>(
            builder: (context, state) {
              if (state is SupervisorLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: green,
                  ),
                );
              } else if (state is SupervisorLoad) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: state.supervisor.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        decoration: BoxDecoration(
                            color: green,
                            borderRadius: BorderRadius.circular(14)),
                        height: 60,
                        width: 356,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                "${AppLocale.supervisorsName.getString(context)}: ${state.supervisor[index].name}",
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                "${AppLocale.supervisorsCity.getString(context)}: ${state.supervisor[index].city}",
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: CircleAvatar(
                                backgroundImage:
                                    NetworkImage("assets/images/adminlogo.png"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }else {
                return Center(child: Text("No Supervisor"),);
              }
            },
          ),
        ),
      ),
    );
  }
}

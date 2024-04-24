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
          leading: IconButton(
            onPressed: () {
              context.push(view: const BottomNavBarAdmin(), isPush: false);
            },
            icon: Icon(
              Icons.arrow_forward,
              color: pureWhite,
            ),
          ),
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
        body: BlocBuilder<SupervisorBloc, SupervisorState>(
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
                      height: 100,
                      width: context.getWidth(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                                padding: EdgeInsets.only(right: 10),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/2048px-User-avatar.svg.png"),
                            ),
                          ),
                          Padding(
                                  padding: const EdgeInsets.only(right: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${AppLocale.supervisorsName.getString(context)}: ${state.supervisor[index].name}",
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                                Text(
                                  "${AppLocale.supervisorsCity.getString(context)}: ${state.supervisor[index].city}",
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text(
                  AppLocale.noSupervisor.getString(context),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

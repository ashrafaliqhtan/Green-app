import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get_it/get_it.dart';
import 'package:green_saudi_app/resources/extensions/screen_handler.dart';
import 'package:green_saudi_app/resources/localization/localization.dart';
import 'package:green_saudi_app/resources/utils/colors.dart';
import 'package:green_saudi_app/resources/utils/spacing.dart';
import 'package:green_saudi_app/service/supabase_services.dart';
import 'package:green_saudi_app/views/Supervisor/bloc/supervisor_bloc.dart';
import 'package:green_saudi_app/views/Supervisor/widget/state_widget.dart';
import 'package:green_saudi_app/views/bottom_nav_bar/view/bottom_nav_bar.dart';

class ScanView extends StatelessWidget {
  const ScanView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SupervisorBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            actionsIconTheme: IconThemeData(color: white),
            backgroundColor: green,
            leading: IconButton(
                onPressed: () {
                  context.push(view: const BottomNavBar(), isPush: false);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: pureWhite,
                )),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.qr_code_scanner,
                  color: white,
                ),
              ),
            ],
            title: Text(
              //TODO: localizition
              AppLocale.deleteQrCode.getString(context),
              style: TextStyle(
                color: white,
              ),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BlocBuilder<SupervisorBloc, SupervisorState>(
                    builder: (context, state) {
                      if (state is SupervisorInitial) {
                        return Column(
                          children: [
                            const IconDisplay(isSuccess: true),
                            Text(
                              //TODO: localizition
                              AppLocale.scanQR.getString(context),
                              style: TextStyle(
                                color: green,
                                fontSize: 30,
                              ),
                            ),
                          ],
                        );
                      } else if (state is SupervisorScanSuccess) {
                        //TODO: localizition
                        return AlertDialog(
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  GetIt.I.get<DBServices>().addVolunteerHours(
                                      addVolunteerHour: 8,
                                      volunteerID: state.qrString);
                                },
                                child: Text(AppLocale.great.getString(context)))
                          ],
                          title: Column(
                            children: [
                              const IconDisplay(isSuccess: true),
                              Text(AppLocale.attendance.getString(context)),
                            ],
                          ),
                        );
                      } else if (state is SupervisorScanFailure) {
                        return Column(
                          children: [
                            const IconDisplay(isSuccess: false),
                            Text(
                              //TODO: localizition
                              AppLocale.failScan.getString(context),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 30,
                              ),
                            ),
                          ],
                        );
                      } else if (state is SupervisorScanCanceled) {
                        return Column(
                          children: [
                            const IconDisplay(isSuccess: null),
                            Text(
                              //TODO: localizition
                              AppLocale.cancelSAcan.getString(context),
                              style: TextStyle(
                                color: green,
                                fontSize: 30,
                              ),
                            ),
                          ],
                        );
                      } else if (state is SupervisorScanErrorUser) {
                        return Column(
                          children: [
                            const IconDisplay(isSuccess: false),
                            Text(
                              //TODO: localizition
                              AppLocale.attendanceAlready.getString(context),
                              style: TextStyle(
                                color: green,
                                fontSize: 30,
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                  height100,
                  TextButton(
                    onPressed: () {
                      BlocProvider.of<SupervisorBloc>(context).add(ScanQR());
                    }, //TODO: localizition
                    child: Column(
                      children: [
                        Text(
                          AppLocale.deleteQrCode.getString(context),
                          style: TextStyle(color: green, fontSize: 25),
                        ),
                        Container(
                          width: 170,
                          margin: const EdgeInsets.only(top: 5),
                          height: 2,
                          color: green,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

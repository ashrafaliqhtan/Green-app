import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:green_saudi_app/resources/qr_code_reader/bloc/scan_bloc.dart';
import 'package:green_saudi_app/resources/utils/colors.dart';
import 'package:green_saudi_app/resources/utils/spacing.dart';
import 'package:green_saudi_app/service/supabase_services.dart';

class ScanView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScanBloc(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: green,
              leading: Icon(
                Icons.qr_code_scanner,
                color: white,
              ),
              title: Text( //TODO: localizition
                'مسح الباركود',
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
                    BlocBuilder<ScanBloc, ScanState>(
                      builder: (context, state) {
                        if (state is ScanInitial) {
                          return Column(
                            children: [
                              Image.asset(
                                //TODO: change image
                                'assets/images/logo_2.png',
                                width: 175,
                                height: 175,
                              ),
                              Text( //TODO: localizition
                                "لنقم بالمسح",
                                style: TextStyle(
                                  color: green,
                                  fontSize: 30,

                                ),
                              ),
                            ],
                          );
                        } else if (state is ScanSuccess) { //TODO: localizition
                          return AlertDialog(actions: [ElevatedButton(onPressed:(){GetIt.I.get<DBServices>().addVolunteerHours(addVolunteerHour: 8);
                          } , child: Text("ممتاز"))],title:Text("تم تسجيل الحضور") ,) ;
                        } else if (state is ScanFailure) {
                          return Column(
                            children: [
                              Image.asset(
                                //TODO: change image
                                'assets/images/logo_2.png',
                                width: 175,
                                height: 175,
                              ),
                              Text(
                                //TODO: localizition
                                'عذرًا، لم نتمكن من قراءة الباركود. يرجى المحاولة مرة أخرى.',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 30,

                                ),
                              ),
                            ],
                          );
                        } else if (state is ScanCanceled) {
                          return Column(
                            children: [
                              Image.asset(
                                //TODO: change image
                                'assets/images/logo_2.png',
                                width: 175,
                                height: 175,
                              ),
                              Text( //TODO: localizition
                                'تم إلغاء مسح الباركود',
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
                        BlocProvider.of<ScanBloc>(context).add(ScanQR());
                      }, //TODO: localizition
                      child: Text("امسح الباركود"),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}

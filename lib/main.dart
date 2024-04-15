import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_saudi_app/data_layer/data_layer.dart';
import 'package:green_saudi_app/service/database_configuration.dart';
import 'package:green_saudi_app/views/Authentication/view/signup_view.dart';
import 'package:green_saudi_app/views/bottom_nav_bar/cubit/nav_bar_cubit.dart';
import 'package:green_saudi_app/views/bottom_nav_bar/view/bottom_nav_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await databaseConfiguration();
  DataInjection().setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (context) => NavBarCubit(),
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     home: BottomNavBar(),
    //   ),
    // );
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpView(),
    );
  }
}

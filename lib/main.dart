import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_saudi_app/views/bottom_nav_bar/cubit/nav_bar_cubit.dart';
import 'package:green_saudi_app/views/bottom_nav_bar/view/bottom_nav_bar.dart';
import 'package:green_saudi_app/views/home_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNavBar(),
      ),
    );
  }
}

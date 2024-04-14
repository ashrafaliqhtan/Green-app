import 'package:flutter/material.dart';
import 'package:green_saudi_app/views/home_view.dart';
import 'package:green_saudi_app/views/profile/profile_user.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProfileUser()
    );
  }
}

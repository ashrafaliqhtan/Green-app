import 'package:flutter/material.dart';
import 'package:green_saudi_app/views/Admin/view/control_panel.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ControlPanel()
    );
  }
}

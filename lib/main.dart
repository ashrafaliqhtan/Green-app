import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:green_saudi_app/data_layer/data_layer.dart';
import 'package:green_saudi_app/service/database_configuration.dart';
import 'package:green_saudi_app/theme/bloc/theme_bloc.dart';
import 'package:green_saudi_app/views/bottom_nav_bar/view/bottom_nav_bar.dart';

import 'package:green_saudi_app/views/onboarding/view/onboarding_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await databaseConfiguration();
  DataInjection().setUp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc()..add(GetThemeEvent()),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          final bloc = context.read<ThemeBloc>();
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: bloc.themeInfo,
            home: BottomNavBar(),
          );
        },
      ),
    );
  }
}

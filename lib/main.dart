import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:green_saudi_app/data_layer/data_layer.dart';
import 'package:green_saudi_app/service/database_configuration.dart';
import 'package:green_saudi_app/theme/bloc/theme_bloc.dart';
import 'package:green_saudi_app/views/Authentication/bloc/auth_bloc.dart';
import 'package:green_saudi_app/views/Authentication/view/splash_view.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc()..add(GetThemeEvent()),
        ),
        BlocProvider(
          create: (context) => AuthBloc()..add(CheckSessionAvailability()),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          final bloc = context.read<ThemeBloc>();
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: bloc.themeInfo,
            home: const SplashView(),
          );
        },
      ),
    );
  }
}

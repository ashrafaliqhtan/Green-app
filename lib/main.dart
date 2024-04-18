import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get_it/get_it.dart';
import 'package:green_saudi_app/data_layer/data_layer.dart';
import 'package:green_saudi_app/localistion/cubit/language_cubit.dart';
import 'package:green_saudi_app/localistion/localistion.dart';
import 'package:green_saudi_app/service/database_configuration.dart';
import 'package:green_saudi_app/service/supabase_services.dart';
import 'package:green_saudi_app/theme/bloc/theme_bloc.dart';
import 'package:green_saudi_app/views/Authentication/bloc/auth_bloc.dart';
import 'package:green_saudi_app/views/Authentication/view/splash_view.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'views/disconnect.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await databaseConfiguration();
  DataInjection().setupAppearance();
  DataInjection().setupDatabase();

  InternetConnection().onStatusChange.listen((status) async {
    if (status == InternetStatus.connected) {
      runApp(const MainApp());
    } else {
      runApp(const Disconnect());
    }
  });
  runApp(
    const MainApp(),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final FlutterLocalization localization = FlutterLocalization.instance;
  @override
  void initState() {
    localization.init(
      mapLocales: [
        MapLocale('ar', AppLocale.AR),
        MapLocale('en', AppLocale.EN),
      ],
      initLanguageCode: 'en',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final FlutterLocalization localization = FlutterLocalization.instance;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(CheckSessionAvailability()),
        ),
        BlocProvider(
          create: (context) => ThemeBloc()..add(GetThemeEvent()),
        ),
        BlocProvider(
          create: (context) => LanguageCubit(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, state) {
              final bloc = context.read<ThemeBloc>();
              return MaterialApp(
                locale: localization.currentLocale,
                debugShowCheckedModeBanner: false,
                theme: bloc.themeInfo,
                supportedLocales: localization.supportedLocales,
                localizationsDelegates: localization.localizationsDelegates,
                home: const SplashView(),
              );
            },
          );
        },
      ),
    );
  }
}

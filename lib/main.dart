import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:green_saudi_app/data_layer/data_layer.dart';
import 'package:green_saudi_app/localization/cubit/language_cubit.dart';
import 'package:green_saudi_app/localization/localization.dart';
import 'package:green_saudi_app/service/database_configuration.dart';
import 'package:green_saudi_app/theme/appearence%20manager/appearence_service.dart';
import 'package:green_saudi_app/theme/bloc/theme_bloc.dart';
import 'package:green_saudi_app/theme/theme.dart';
import 'package:green_saudi_app/views/Authentication/bloc/auth_bloc.dart';
import 'package:green_saudi_app/views/Authentication/view/splash_view.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'views/disconnect.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await  GetStorage.init();
  await databaseConfiguration();
  DataInjection().setupAppearance();
        DataInjection().setupGetit();
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
         const MapLocale('ar', AppLocale.AR),
         const MapLocale('en', AppLocale.EN),
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
      child: Builder(
        builder: (context) {
                        context.read<ThemeBloc>();

          return BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              
              return BlocBuilder<LanguageCubit, LanguageState>(
                builder: (context, state) {
                  return MaterialApp(
                    locale: localization.currentLocale,
                    debugShowCheckedModeBanner: false,
                    theme: appThemes[ GetIt.I.get<AppearanceServices>().currentTheme],
                   
                    supportedLocales: localization.supportedLocales,
                    localizationsDelegates: localization.localizationsDelegates,
                    home: const SplashView(),
                  );
                },
              );
            },
          );
        }
      ),
    );
  }
}

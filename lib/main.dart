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
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';
import 'package:green_saudi_app/views/Admin/view/control_panel.dart';
import 'package:green_saudi_app/views/Authentication/bloc/auth_bloc.dart';
import 'package:green_saudi_app/views/Authentication/view/splash_view.dart';
import 'package:green_saudi_app/views/profile/view/settings_user.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await databaseConfiguration();
  DataInjection().setupAppearance();
  InternetConnection().onStatusChange.listen((status) async {

      if (status == InternetStatus.connected) {
        if(GetIt.I.get<DBServices>().isInitializeSupabase==false){
        DataInjection().setupDatabase();
        
        }
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
      initLanguageCode: 'ar',
    );
    localization.onTranslatedLanguage = _onTranslatedLanguage;
    super.initState();
  }

// the setState function here is a must to add
  void _onTranslatedLanguage(Locale? locale) {
    //setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final FlutterLocalization localization = FlutterLocalization.instance;
    print(localization.currentLocale?.languageCode);
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
                home: const ControlPanel(),
              );
            },
          );
        },
     ),
);
}
}


class Disconnect extends StatelessWidget {
  const Disconnect({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/offline-concept-illustration_114360-7063.jpg"),
              height16,
              Text(
                'No internet connection',
                style: TextStyle(fontSize: 30, color: green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

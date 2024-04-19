import 'package:get_it/get_it.dart';
import 'package:green_saudi_app/service/supabase_services.dart';
import 'package:green_saudi_app/service/appearence_service.dart';

class DataInjection {
  final locator = GetIt.I;

  setupDatabase() {
    GetIt.I.registerSingleton<DBServices>(DBServices());
  }

  setupAppearance() {
    GetIt.I.registerSingleton<AppearanceServices>(AppearanceServices());
  }
}

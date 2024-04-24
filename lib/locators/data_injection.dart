import 'package:get_it/get_it.dart';
import 'package:green_saudi_app/service/supabase/Auth/supabase_services.dart';
import 'package:green_saudi_app/service/appearence_service.dart';

class DataInjection {
  final locator = GetIt.I;

  setupDatabase() {
    locator.registerSingleton<DBServices>(DBServices());
  }

  setupAppearance() {
    locator.registerSingletonAsync<AppearanceServices>(() async=> AppearanceServices()..getMode());
  }
}

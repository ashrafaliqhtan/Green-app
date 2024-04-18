import 'package:get_it/get_it.dart';
import 'package:green_saudi_app/service/supabase_services.dart';
import 'package:green_saudi_app/theme/appearence%20manager/appearence_service.dart';

class DataInjection {
  final locator = GetIt.I;
 
  setupGetit(){
    locator.registerSingleton<DBServices>(DBServices());
}

  setupAppearance() {
    locator.registerSingletonAsync<AppearanceServices>(() async=> AppearanceServices()..getMode());
  }
}

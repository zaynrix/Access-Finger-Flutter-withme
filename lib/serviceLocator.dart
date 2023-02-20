import 'package:accesswithfinger/localAuthinticationsService.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

void setupLocator() {
  sl.registerLazySingleton(() => LocalAuthenticationService());
}

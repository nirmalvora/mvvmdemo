import 'package:get_it/get_it.dart';
import 'package:mvvmdemo/core/helper/navigation_service.dart';
import 'package:mvvmdemo/core/repositories/api_repository.dart';
import 'package:mvvmdemo/core/viewmodel/home/home_viewmodel.dart';
import 'package:mvvmdemo/core/viewmodel/login/login_viewmodel.dart';
import 'package:mvvmdemo/core/viewmodel/network_view_model.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<APIRepository>(APIRepository());

  locator.registerLazySingleton(() => NetworkViewModel());
  locator.registerLazySingleton(() => HomeViewModel());
  locator.registerLazySingleton(() => LoginViewModel());

  locator.registerLazySingleton(() => NavigationService());
}

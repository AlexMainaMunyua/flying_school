import 'package:flying_school/core/services/service.dart';
import 'package:flying_school/core/view/CrudModel.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(()=> TopicApi('Topics'));
  locator.registerLazySingleton(()=> CRUDModel());

  locator.registerLazySingleton(()=> BlogApi('Blog'));
  locator.registerLazySingleton(()=> BlogCRUDModel());
}

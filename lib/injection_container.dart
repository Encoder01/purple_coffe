import 'package:get_it/get_it.dart';
import 'package:purple_coffe/Screens/dashboard/data/data_sources/firestore_datasource.dart';
import 'package:purple_coffe/Screens/dashboard/data/data_sources/firestore_datasource_impl.dart';
import 'package:purple_coffe/Screens/dashboard/data/repositories/firestore_repository_impl.dart';
import 'package:purple_coffe/Screens/dashboard/domain/repositories/firestore_repository.dart';
import 'package:purple_coffe/Screens/dashboard/domain/use_cases/add_user_usecase.dart';
import 'package:purple_coffe/Screens/login/domain/use_cases/login_google.dart';
import 'package:purple_coffe/Screens/login/domain/use_cases/sign_out.dart';
import 'package:purple_coffe/Screens/login/domain/use_cases/sign_up.dart';

import 'Screens/login/data/data_sources/authenticate_datasource_impl.dart';
import 'Screens/login/data/data_sources/authentication_datasource.dart';
import 'Screens/login/data/repositories/login_repository_impl.dart';
import 'Screens/login/domain/repositories/login_repository.dart';
import 'Screens/login/domain/use_cases/check_out.dart';
import 'Screens/login/domain/use_cases/login.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  initInjections(serviceLocator);
}

void initInjections(GetIt serviceLocator) {
  serviceLocator.registerSingleton<IAuthenticationDatasource>(
    IAuthenticationDatasourceImplementation(),
  );

  serviceLocator.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(
      serviceLocator(),
    ),
  );
  serviceLocator.registerSingleton<FirestoreDatasource>(
    FirestoreDatasourceImplementation(),
  );
  serviceLocator.registerLazySingleton<FirestoreRepository>(
        () => FirestoreRepositoryImplementation(
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => AddUserUseCase(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => Login(
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => CheckAuthenticationUseCase(
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => LoginGoogle(
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => SignUp(
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => SignOut(
      serviceLocator(),
    ),
  );
}

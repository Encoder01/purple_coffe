import 'package:get_it/get_it.dart';
import 'package:purple_coffe/Screens/dashboard/data/data_sources/dashboard_firestore_datasource.dart';
import 'package:purple_coffe/Screens/dashboard/data/data_sources/dashboard_firestore_datasource_impl.dart';
import 'package:purple_coffe/Screens/dashboard/data/data_sources/payment_datasource.dart';
import 'package:purple_coffe/Screens/dashboard/data/data_sources/payment_datasource_impl.dart';
import 'package:purple_coffe/Screens/dashboard/data/repositories/dashboard_firestore_repository_impl.dart';
import 'package:purple_coffe/Screens/dashboard/data/repositories/payment_repository_impl.dart';
import 'package:purple_coffe/Screens/dashboard/domain/repositories/dashobard_firestore_repository.dart';
import 'package:purple_coffe/Screens/dashboard/domain/repositories/payment_repository.dart';
import 'package:purple_coffe/Screens/dashboard/domain/use_cases/fortunes/add_fortune_usecase.dart';
import 'package:purple_coffe/Screens/dashboard/domain/use_cases/fortunes/delete_fortune_usercase.dart';
import 'package:purple_coffe/Screens/dashboard/domain/use_cases/fortunes/get_fortune_usecase.dart';
import 'package:purple_coffe/Screens/dashboard/domain/use_cases/fortunes/set_fortune_usecase.dart';
import 'package:purple_coffe/Screens/dashboard/domain/use_cases/payment/init_pay_usecase.dart';
import 'package:purple_coffe/Screens/dashboard/domain/use_cases/payment/make_pay_usecase.dart';
import 'package:purple_coffe/Screens/dashboard/domain/use_cases/payment/onecredit_pay_usecase.dart';
import 'package:purple_coffe/Screens/dashboard/domain/use_cases/payment/threecredit_pay_usecase.dart';
import 'package:purple_coffe/Screens/dashboard/domain/use_cases/user/get_user_usecase.dart';
import 'package:purple_coffe/Screens/dashboard/domain/use_cases/user/set_user_usercase.dart';
import 'package:purple_coffe/Screens/login/data/data_sources/authenticate_datasource_impl.dart';
import 'package:purple_coffe/Screens/login/data/data_sources/authentication_datasource.dart';
import 'package:purple_coffe/Screens/login/data/repositories/login_repository_impl.dart';
import 'package:purple_coffe/Screens/login/domain/repositories/login_repository.dart';
import 'package:purple_coffe/Screens/login/domain/use_cases/check_out.dart';
import 'package:purple_coffe/Screens/login/domain/use_cases/login.dart';
import 'package:purple_coffe/Screens/login/domain/use_cases/login_google.dart';
import 'package:purple_coffe/Screens/login/domain/use_cases/reset_pass_usecase.dart';
import 'package:purple_coffe/Screens/login/domain/use_cases/sign_out.dart';
import 'package:purple_coffe/Screens/login/domain/use_cases/sign_up.dart';
import 'package:purple_coffe/config/routes/router.gr.dart';

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
  serviceLocator.registerSingleton<DashboardFirestoreDatasource>(
    DashboardFirestoreDatasourceImplementation(),
  );
  serviceLocator.registerLazySingleton<DashboardFirestoreRepository>(
    () => DashboardFirestoreRepositoryImplementation(
      serviceLocator(),
    ),
  );

  serviceLocator.registerSingleton<PaymentDataSource>(
    PaymentDataSourceImpl(),
  );
  serviceLocator.registerLazySingleton<PaymentRepository>(
    () => PaymentRepositoyryImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => AddFortuneUseCase(
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => SetFortuneUseCase(
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => DeleteFortuneUseCase(
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => GetFortuneUseCase(
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => SetUserUseCase(
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => GetUserUseCase(
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => LoginUserCase(
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => CheckAuthenticationUseCase(
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => LoginGoogleUseCase(
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => SignUpUseCase(
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => SignOutUseCase(
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => ResetPassUseCase(
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => InitPayUseCase(
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => MakePayUseCase(
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => ShowOneCreditUseCase(
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => ShowThreeCreditUseCase(
      serviceLocator(),
    ),
  );
  serviceLocator.registerSingleton<AppRouter>(AppRouter());
}

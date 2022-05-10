import 'package:auto_route/annotations.dart';
import 'package:purple_coffe/Screens/dashboard/presentation/pages/dashboard.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: DashBoard,
    )
  ],
)
class $AppRouter {}
import 'package:auto_route/auto_route.dart';
import 'package:purple_coffe/Screens/dashboard/presentation/pages/dashboard.dart';
import 'package:purple_coffe/Screens/dashboard/presentation/pages/fortune_detail.dart';
import 'package:purple_coffe/Screens/dashboard/presentation/pages/my_fortune_tells.dart';
import 'package:purple_coffe/Screens/dashboard/presentation/pages/paywall.dart';
import 'package:purple_coffe/Screens/dashboard/presentation/pages/profile.dart';
import 'package:purple_coffe/Screens/dashboard/presentation/pages/send_fortune_tells.dart';
import 'package:purple_coffe/Screens/dashboard/presentation/widgets/sended_fortune.dart';
import 'package:purple_coffe/Screens/login/presentation/pages/login_page.dart';
import 'package:purple_coffe/Screens/login/presentation/pages/signup_page.dart';
import 'package:purple_coffe/Screens/login/presentation/pages/start_up.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: StartupScreen,
      initial: true,
      children: [
        AutoRoute(
          page: DashBoard,
          children: [
            AutoRoute(
              page: SendFortuneTells,
            ),
            AutoRoute(
              page: MyFortuneTells,
            ),
            AutoRoute(
              page: Paywall,
            ),
            AutoRoute(
              page: ProfilePage,
            ),
          ],
        ),
        AutoRoute(
          page: LoginPage,
        ),
      ],
    ),
    AutoRoute(
      page: FortuneDetail,
    ),
    AutoRoute(
      page: SendedFortune,
    ),
    AutoRoute(
      page: SignUpPage,
    ),
  ],
)
class $AppRouter {}

import 'package:get/get.dart';
import 'package:mercadin/src/pages/auth/view/sign_in_screen.dart';
import 'package:mercadin/src/pages/base/base_screen.dart';
import 'package:mercadin/src/pages/splash/splash_screen.dart';

import '../pages/auth/view/sign_up_screen.dart';
import '../pages/home/binding/home_binding.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      page: () => const SplashScreen(),
      name: PagesRoutes.splashRoute,
    ),
    GetPage(
      page: () => SignInScreen(),
      name: PagesRoutes.signInRoute,
    ),
    GetPage(
      page: () => SignUpScreen(),
      name: PagesRoutes.signUpRoute,
    ),
    GetPage(
      page: () => BaseScreen(),
      name: PagesRoutes.baseRoute,
      bindings: [
        HomeBinding(),
      ],
    ),
  ];
}

abstract class PagesRoutes {
  static const String signInRoute = '/signin';
  static const String signUpRoute = '/singup';
  static const String splashRoute = '/splash';
  static const String baseRoute = '/';
}

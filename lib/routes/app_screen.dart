import 'package:animal_wealth_app/routes/app_route.dart';
import 'package:animal_wealth_app/view/splash/splash_screen.dart';
import 'package:get/get.dart';

class AppScreen {
  static final screen = [
    GetPage(
      name: AppRoute.splashScreen,
      page: () => const SplashScreen(),
    ),
  ];
}

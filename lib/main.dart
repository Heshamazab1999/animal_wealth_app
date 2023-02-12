import 'package:animal_wealth_app/controller/language_controller.dart';
import 'package:animal_wealth_app/controller/theme_controller.dart';
import 'package:animal_wealth_app/routes/app_route.dart';
import 'package:animal_wealth_app/routes/app_screen.dart';
import 'package:animal_wealth_app/theme/dark_theme.dart';
import 'package:animal_wealth_app/theme/light_theme.dart';
import 'package:animal_wealth_app/util/app_constants.dart';
import 'package:animal_wealth_app/util/messages.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helper/get_di.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Map<String, Map<String, String>> languages = await di.init();

  runApp(MyApp(
    languages: languages,
  ));
}

class MyApp extends StatelessWidget {
  final Map<String, Map<String, String>>? languages;

  const MyApp({Key? key, this.languages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(builder: (localizeController) {
      return GetBuilder<ThemeController>(builder: (themeController) {
        return GetMaterialApp(
          title: AppConstants.APP_NAME,
          debugShowCheckedModeBanner: false,
          navigatorKey: Get.key,
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
          ),
          theme: themeController.darkTheme ? dark : light,
          locale: localizeController.locale,
          translations: Messages(languages: languages!),
          fallbackLocale: Locale(AppConstants.languages[0].languageCode!,
              AppConstants.languages[0].countryCode!),
          // initialRoute: GetPlatform.isWeb ? RouteHelper.getInitialRoute() : RouteHelper.getSplashRoute(orderID),
          getPages: AppScreen.screen,
          initialRoute: AppRoute.splashScreen,
          defaultTransition: Transition.topLevel,
          transitionDuration: const Duration(milliseconds: 500),
        );
      });
    });
  }
}

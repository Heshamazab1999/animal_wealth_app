import 'dart:async';

import 'package:animal_wealth_app/util/dimensions.dart';
import 'package:connectivity/connectivity.dart';
import 'package:animal_wealth_app/controller/splash_controller.dart';
import 'package:animal_wealth_app/util/images.dart';
import 'package:animal_wealth_app/view/base/no_internet_screen.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  final controller = Get.put(SplashController());
  bool? isNotConnected;
  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;

  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected && isAlertSet == false) {
            showDialogBox();
            setState(() => isAlertSet = true);
          }
        },
      );

  @override
  void initState() {
    super.initState();
    getConnectivity();
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }

  // void _route() {
  //   Get.find<SplashController>().getConfigData().then((isSuccess) {
  //     if (isSuccess) {
  //       Timer(Duration(seconds: 1), () async {
  //         int _minimumVersion = 0;
  //         if (GetPlatform.isAndroid) {
  //           _minimumVersion = Get.find<SplashController>()
  //               .configModel
  //               .appMinimumVersionAndroid;
  //         } else if (GetPlatform.isIOS) {
  //           _minimumVersion =
  //               Get.find<SplashController>().configModel.appMinimumVersionIos;
  //         }
  //         if (AppConstants.APP_VERSION < _minimumVersion ||
  //             Get.find<SplashController>().configModel.maintenanceMode) {
  //           Get.offNamed(RouteHelper.getUpdateRoute(
  //               AppConstants.APP_VERSION < _minimumVersion));
  //         } else {
  //           if (widget.orderID != null) {
  //             Get.offNamed(
  //                 RouteHelper.getOrderDetailsRoute(int.parse(widget.orderID)));
  //           } else {
  //             if (Get.find<AuthController>().isLoggedIn()) {
  //               Get.find<AuthController>().updateToken();
  //               await Get.find<WishListController>().getWishList();
  //               if (Get.find<LocationController>().getUserAddress() != null) {
  //                 Get.offNamed(RouteHelper.getInitialRoute());
  //               } else {
  //                 Get.offNamed(RouteHelper.getAccessLocationRoute('splash'));
  //               }
  //             } else {
  //               if (Get.find<SplashController>().showIntro()) {
  //                 if (AppConstants.languages.length > 1) {
  //                   Get.offNamed(RouteHelper.getLanguageRoute('splash'));
  //                 } else {
  //                   Get.offNamed(RouteHelper.getOnBoardingRoute());
  //                 }
  //               } else {
  //                 Get.offNamed(RouteHelper.getSignInRoute(RouteHelper.splash));
  //               }
  //             }
  //           }
  //         }
  //       });
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _globalKey,
        // body: ListView.builder(
        //     itemCount: controller.list.length,
        //     shrinkWrap: true,
        //     itemBuilder: (_, index) => Obx(() => Radio(
        //         value: controller.list[index],
        //         groupValue: controller.groupValue.value,
        //         onChanged: (value) {
        //           controller.groupValue.value = value as int;
        //         })))
        body: Center(
          child: Image.asset(
            Images.logo,
            fit: BoxFit.cover,
            width: Dimensions.width * 0.8,
          ),
        ));
  }

  showDialogBox() => showCupertinoDialog<String>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text('No Connection'),
          content: const Text('Please check your internet connectivity'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.pop(context, 'Cancel');
                setState(() => isAlertSet = false);
                isDeviceConnected =
                    await InternetConnectionChecker().hasConnection;
                if (!isDeviceConnected && isAlertSet == false) {
                  showDialogBox();
                  setState(() => isAlertSet = true);
                }
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
}

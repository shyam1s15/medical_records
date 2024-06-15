import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_records/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medical_records/services/app_preference_service.dart';

class PlatformMiddleware extends GetMiddleware {
  // priority this value the smaller the better
  @override
  int? priority = 0;

  PlatformMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    print(route);
    // print((route != Routes.WELCOME_SCREEN));
    print(AppPreferences.userToken ?? "");
    if (GetPlatform.isMobile || Get.width < 500) {
      bool isUserSignedIn = true;
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null || AppPreferences.userToken == null) {
          print('User is currently signed out!');
          isUserSignedIn = false;
        }
      });
      if (!isUserSignedIn) {
        return const RouteSettings(name: Routes.WELCOME_SCREEN);
      }
    } else {
      return RouteSettings(name: Routes.NOT_FOUND);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';
import 'package:medical_records/routes/routes.dart';

class PlatformMiddleware extends GetMiddleware {
  // priority this value the smaller the better
  @override
  int? priority = 0;

  PlatformMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    
    if (GetPlatform.isMobile || Get.width < 500) {
      return null;
    } else {
      return RouteSettings(name: Routes.NOT_FOUND);
    }
  }
}

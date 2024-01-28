import 'package:get/get.dart';
import 'package:medical_records/controllers/home/home_binding.dart';
import 'package:medical_records/middlewares/platform_middleware.dart';
import 'package:medical_records/views/home/home_page.dart';
import 'package:medical_records/views/non-servicable/404.dart';

class Routes{
  static const INITIAL = '/home';
  static const NOT_FOUND = '/not-found';

  static final routes = [
  //   GetPage(
  //     name: '/splash', 
  //     page: () => SplashPage(),
  //   ),
  //   GetPage(
  //     name: '/login', 
  //     page: () => LoginPage(),
  //   ),
    GetPage(
      name: '/home', 
      page: () => HomePage(),
      binding: HomeBinding(),
      middlewares: [
        PlatformMiddleware(priority: 0),
      ]
    ),
    GetPage(name: NOT_FOUND, 
    page: () => NotFoundPage(),
    ),
  //   GetPage(
  //     name: '/product/:id', 
  //     page: () => ProductPage(),
  //     binding: ProductBinding(),
  //   )
  ];
}
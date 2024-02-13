import 'package:get/get.dart';
import 'package:medical_records/controllers/home/home_binding.dart';
import 'package:medical_records/controllers/record_listing/record_listing_binding.dart';
import 'package:medical_records/controllers/welcome/welcome_binding.dart';
import 'package:medical_records/middlewares/platform_middleware.dart';
import 'package:medical_records/views/home/home_page.dart';
import 'package:medical_records/views/login/welcome_screen.dart';
import 'package:medical_records/views/non-servicable/404.dart';
import 'package:medical_records/views/record_listing/record_listing_page.dart';

class Routes {
  static const INITIAL = '/home';
  static const NOT_FOUND = '/not-found';
  static const RECORDS = '/records';
  static const WELCOME_SCREEN = '/welcome';

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
        ]),
    GetPage(
      name: NOT_FOUND,
      page: () => NotFoundPage(),
    ),
    GetPage(
        name: RECORDS,
        page: () => RecordListingPage(),
        binding: RecordListingBinding(),
        middlewares: [PlatformMiddleware(priority: 0)]),
    GetPage(name: WELCOME_SCREEN, page: () => WelcomePage(), binding: WelcomeBinding())
  ];
}

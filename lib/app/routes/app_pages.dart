import 'package:get/get.dart';
import 'package:healthapp/app/modules/home/bindings/health_binding.dart';
import 'package:healthapp/app/modules/home/controllers/health_controller.dart';
import 'package:healthapp/app/modules/home/views/health_info.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.HEALTH,
      page: () => HealthInfo(),
      binding: HealthBinding(),
    ),
  ];
}

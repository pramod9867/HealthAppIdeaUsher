import 'package:get/get.dart';
import 'package:healthapp/app/modules/home/controllers/health_controller.dart';



class HealthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HealthController>(
      () => HealthController(),
    );
  }
}

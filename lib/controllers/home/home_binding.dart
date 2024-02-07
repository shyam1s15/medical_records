import 'package:get/get.dart';
import 'package:medical_records/controllers/home/home_controller.dart';
import 'package:medical_records/repositories/medical_repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<MedicalRepository>(() => MedicalRepository(Get.find()));
  }
}

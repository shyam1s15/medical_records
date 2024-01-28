import 'package:get/get.dart';
import 'package:medical_records/services/networking/api_service.dart';
import 'package:medical_records/services/networking/base_provider.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(BaseProvider(), permanent: true);
    Get.put(ApiService(Get.find()), permanent: true);
  }
}

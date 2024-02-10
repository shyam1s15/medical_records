import 'package:get/get.dart';
import 'package:medical_records/controllers/record_listing/record_listing_controller.dart';
import 'package:medical_records/repositories/medical_repository.dart';

class RecordListingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecordListingController>(() => RecordListingController());
    Get.lazyPut<MedicalRepository>(() => MedicalRepository(Get.find()));
  }
}

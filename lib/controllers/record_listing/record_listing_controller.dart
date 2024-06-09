import 'package:get/get.dart';
import 'package:medical_records/dtos/requestDtos/page_dto.dart';
import 'package:medical_records/dtos/responseDtos/record_listing_dto.dart';
import 'package:medical_records/models/response_model.dart';
import 'package:medical_records/repositories/medical_repository.dart';
import 'package:medical_records/routes/routes.dart';
import 'package:medical_records/shared/typedef.dart';
import 'package:medical_records/shared/utils/Utility.dart';
import 'package:medical_records/shared/utils/date_utils.dart';
import 'package:medical_records/shared/widgets/common_widgets.dart';

class RecordListingController extends GetxController with StateMixin {
  MedicalRepository medicalRepository = Get.find();
  var records = <RecordListingModel>[].obs;
  var currentPage = 0.obs;
  Rx<DateTime> currentMonthDate = Rx<DateTime>(DateTime.now());

  @override
  void onInit() {
    super.onInit();
    fetchRecords();
  }

  void fetchRecords() async {
    change(null, status: RxStatus.loading());

    int pageId = 0;
    while (true && pageId < 10) {
      ResponseModel<RecordListingGroupModel?> apiResp = await medicalRepository
          .fetchRecords(new PageModel(page: new PageInfoModel(pageId: pageId)));
      if (apiResp.errorInfo.error > 0 || apiResp.content == null) {
        CommonWidgets.snackBar("error", apiResp.errorInfo.message);
        change(null, status: RxStatus.error(apiResp.errorInfo.message));
        Get.toNamed(Routes.WELCOME_SCREEN);
        return;
      } else {
        if (Utility.nonNullNonEmpty(apiResp.content!.recordList)) {
          records.addAll(apiResp.content!.recordList);
          pageId += 1;
          if (apiResp.content!.recordList.length < 20) {
            break;
          }
        } else {
          break;
        }
      }
    }
    if (Utility.nonNullNonEmpty(records)) {
      change(records, status: RxStatus.success());
    } else {
      change(records, status: RxStatus.empty());
    }
  }

  void updatedMonth(int month, int year) async {
    DateTime dateTime = DateTime(year, month, 1);
    currentMonthDate.value = dateTime;

    await medicalRepository.downloadExcel(dateTime);
  }
}

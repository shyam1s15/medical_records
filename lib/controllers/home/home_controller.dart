import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_records/dtos/requestDtos/MedicalRecordModel.dart';
import 'package:medical_records/models/response_model.dart';
import 'package:medical_records/repositories/medical_repository.dart';
import 'package:medical_records/shared/utils/date_utils.dart';
import 'package:medical_records/shared/widgets/common_widgets.dart';

class HomeController extends GetxController with StateMixin {
  MedicalRepository medicalRepository = Get.find();

  // Text controllers for input boxes
  late List<TextEditingController> inputControllers;
  Set<int> oldSumSeq = {0, 1, 4, 5, 8, 9};
  Set<int> newSumSeq = {2, 3, 6, 7, 10, 11};
  Set<int> maleSumSeq = {0, 2, 4, 6, 8, 10};
  Set<int> femaleSumSeq = {1, 3, 5, 7, 9, 11};

  RxInt sumMale = RxInt(0);
  RxInt sumFemale = RxInt(0);
  RxInt sumOld = RxInt(0);
  RxInt sumNew = RxInt(0);

  Map<String, int> dropdownItems = {
    'Full Opd': 0,
    'Half Opd': 1,
    'No Opd': 2,
  };

  RxString opdSelected = "Full Opd".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    inputControllers = List.generate(12, (index) {
      var controller = TextEditingController();
      controller.text = '0'; // Set default value '0'
      controller.addListener(() {
        updateSum(controller); // Update the sum for the specific controller
      });
      return controller;
    });
  }

  void updateOpd(String? newValue) {
    opdSelected.value = newValue ?? "Full Opd";
  }

  void updateSum(TextEditingController controller) {
    sumMale.value = 0;
    sumFemale.value = 0;
    sumNew.value = 0;
    sumOld.value = 0;

    for (int i = 0; i < 12; i++) {
      if (maleSumSeq.contains(i)) {
        sumMale.value += int.tryParse(inputControllers[i].text) ?? 0;
      }
      if (femaleSumSeq.contains(i)) {
        sumFemale.value += int.tryParse(inputControllers[i].text) ?? 0;
      }
      if (oldSumSeq.contains(i)) {
        sumOld.value += int.tryParse(inputControllers[i].text) ?? 0;
      }
      if (newSumSeq.contains(i)) {
        sumNew.value += int.tryParse(inputControllers[i].text) ?? 0;
      }
    }
  }

  Future<void> onSave() async {
    Group upto15 = Group(
        name: "0-15 years",
        oldMale: int.tryParse(inputControllers[0].text) ?? 0,
        oldFemale: int.tryParse(inputControllers[1].text) ?? 0,
        newMale: int.tryParse(inputControllers[2].text) ?? 0,
        newFemale: int.tryParse(inputControllers[3].text) ?? 0);

    Group upto60 = Group(
        name: "15-60 years",
        oldMale: int.tryParse(inputControllers[4].text) ?? 0,
        oldFemale: int.tryParse(inputControllers[5].text) ?? 0,
        newMale: int.tryParse(inputControllers[6].text) ?? 0,
        newFemale: int.tryParse(inputControllers[7].text) ?? 0);

    Group moreThan60 = Group(
        name: "60+ years",
        oldMale: int.tryParse(inputControllers[8].text) ?? 0,
        oldFemale: int.tryParse(inputControllers[9].text) ?? 0,
        newMale: int.tryParse(inputControllers[10].text) ?? 0,
        newFemale: int.tryParse(inputControllers[11].text) ?? 0);

    MedicalRecordModel requestModel = MedicalRecordModel(
        groups: [upto15, upto60, moreThan60],
        id: null,
        opdDate: DateUtil.appBackendDate(DateTime.now()),
        opdType: dropdownItems[opdSelected.value] ?? 0,
        updatedAt: DateUtil.appBackendDate(DateTime.now()));

    ResponseModel apiResp = await medicalRepository.saveRecord(requestModel);
    if (apiResp.errorInfo.error > 0) {
      CommonWidgets.snackBar("error", apiResp.errorInfo.message);
    } else {
      CommonWidgets.showSuccessToast("Success", "Data Saved Successfully");
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    inputControllers.forEach((controller) {
      controller
          .removeListener(() => updateSum(controller)); // Remove the listener
      controller.dispose();
    });
    super.onClose();
  }
}

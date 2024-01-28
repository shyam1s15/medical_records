import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin {
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

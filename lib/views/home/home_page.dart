import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_records/controllers/home/home_controller.dart';
import 'package:medical_records/shared/utils/Utility.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('HomePage')),
        body: SafeArea(child: MyForm()));
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  HomeController controller = Get.find();

  // Date fixed from code
  DateTime fixedDate = DateTime.now();

  // Drop-down options
  List<String> dropdownOptions = ['Full Opd', 'Half Opd', 'No Opd'];

  @override
  Widget build(BuildContext context) {
    return controller.obx((state) {
      if (state == null) {
        return _isLoading();
      }
      return _build(context: context);
    }, onLoading: _isLoading());
  }

  Widget _build({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => Text(
                  'Fixed Date: ${Utility.appDisplayDate(controller.opdDate.value)}'),
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: controller.opdSelected.value,
              items: controller.dropdownItems.keys.map((option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
              onChanged: (value) {
                controller.updateOpd(value);
              },
              decoration: InputDecoration(
                labelText: 'Select an Opd',
              ),
            ),
            SizedBox(height: 16.0),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('0-15 Years'),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        Expanded(
                          child: Obx(
                            () => TextFormField(
                              keyboardType: TextInputType.number,
                              controller: controller.inputControllers[0],
                              decoration: InputDecoration(
                                labelText: 'Old Male',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: Obx(
                            () => TextFormField(
                              keyboardType: TextInputType.number,
                              controller: controller.inputControllers[1],
                              decoration: InputDecoration(
                                labelText: 'Old Female',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        Expanded(
                          child: Obx(
                            () => TextFormField(
                              keyboardType: TextInputType.number,
                              controller: controller.inputControllers[2],
                              decoration: InputDecoration(
                                labelText: 'New Male',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: Obx(
                            () => TextFormField(
                              keyboardType: TextInputType.number,
                              controller: controller.inputControllers[3],
                              decoration: InputDecoration(
                                labelText: 'New Female',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('15-60 Years'),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        Expanded(
                          child: Obx(
                            () => TextFormField(
                              keyboardType: TextInputType.number,
                              controller: controller.inputControllers[4],
                              decoration: InputDecoration(
                                labelText: 'Old Male',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: Obx(() => TextFormField(
                                keyboardType: TextInputType.number,
                                controller: controller.inputControllers[5],
                                decoration: InputDecoration(
                                  labelText: 'Old Female',
                                ),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        Expanded(
                          child: Obx(() => TextFormField(
                                keyboardType: TextInputType.number,
                                controller: controller.inputControllers[6],
                                decoration: InputDecoration(
                                  labelText: 'New Male',
                                ),
                              )),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: Obx(() => TextFormField(
                                keyboardType: TextInputType.number,
                                controller: controller.inputControllers[7],
                                decoration: InputDecoration(
                                  labelText: 'New Female',
                                ),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('60+ Years'),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        Expanded(
                          child: Obx(() => TextFormField(
                                keyboardType: TextInputType.number,
                                controller: controller.inputControllers[8],
                                decoration: InputDecoration(
                                  labelText: 'Old Male',
                                ),
                              )),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: Obx(() => TextFormField(
                                keyboardType: TextInputType.number,
                                controller: controller.inputControllers[9],
                                decoration: InputDecoration(
                                  labelText: 'Old Female',
                                ),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        Expanded(
                          child: Obx(() => TextFormField(
                                keyboardType: TextInputType.number,
                                controller: controller.inputControllers[10],
                                decoration: InputDecoration(
                                  labelText: 'New Male',
                                ),
                              )),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: Obx(() => TextFormField(
                                keyboardType: TextInputType.number,
                                controller: controller.inputControllers[11],
                                decoration: InputDecoration(
                                  labelText: 'New Female',
                                ),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Sums Information',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Sum Male',
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 8.0),
                            Obx(() => Text(
                                  '${controller.sumMale}',
                                  style: TextStyle(fontSize: 18),
                                )),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Sum Female',
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 8.0),
                            Obx(() => Text(
                                  '${controller.sumFemale}',
                                  style: TextStyle(fontSize: 18),
                                )),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Sum Old',
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 8.0),
                            Obx(() => Text(
                                  '${controller.sumOld}',
                                  style: TextStyle(fontSize: 18),
                                )),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Sum New',
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 8.0),
                            Obx(() => Text(
                                  '${controller.sumNew}',
                                  style: TextStyle(fontSize: 18),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle form submission here
                controller.onSave();
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _isLoading() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

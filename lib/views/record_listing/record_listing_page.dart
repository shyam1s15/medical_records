import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_records/controllers/record_listing/record_listing_controller.dart';
import 'package:medical_records/routes/routes.dart';
import 'package:medical_records/shared/utils/Utility.dart';
import 'package:medical_records/shared/widgets/custom_button.dart';

class RecordListingPage extends GetView<RecordListingController> {
  const RecordListingPage({super.key});

  @override
  Widget build(BuildContext context) {
    //controller.fetchRecords();

    return controller.obx(
      (state) {
        if (state == null) {
          return _isLoading();
        }
        return _build(context: context);
      },
      onLoading: _isLoading(),
    );
  }

  Widget _build({required BuildContext context}) {
    return Scaffold(
        appBar: AppBar(title: Text('Ayush Medical Record System')),
        body: SafeArea(
            child: RecordListingWidget(
          recordController: controller,
        )));
  }

  Widget _isLoading() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class RecordListingWidget extends StatelessWidget {
  final RecordListingController recordController;
  const RecordListingWidget({required this.recordController, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
                  text: 'Add OPD',
                  color: Colors.green,
                  onPressed: () {
                    Get.toNamed(Routes.INITIAL, arguments: {'new_opd': true});
                  },
                )
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columnSpacing: 12,
            horizontalMargin: 12,
            //minWidth: 600,
            columns: const [
              DataColumn(label: Text('Date')),
              DataColumn(label: Text('OPD Type')),
              DataColumn(label: Text('Old Total')),
              DataColumn(label: Text('New Total')),
              DataColumn(label: Text('Action')),
            ],
            rows: recordController.records.map((data) {
              return DataRow(cells: [
                DataCell(Text('${Utility.appDisplayDate(data.opd_date)}')),
                DataCell(Text('${data.id}')),
                DataCell(Text('${data.old_total}')),
                DataCell(Text('${data.new_total}')),
                DataCell(CustomButton(
                  text: 'Action',
                  color: Colors.green,
                  onPressed: () {
                    print(data.id);
                    Get.toNamed(Routes.INITIAL, arguments: {'id': data.id});
                  },
                )),
              ]);
            }).toList(),
          ),
        ),
      ],
    );
  }
}

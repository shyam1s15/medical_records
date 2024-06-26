import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_month_picker/flutter_custom_month_picker.dart';
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
        onEmpty: _emptyListWidet(),
        onError: (error) {
          print(error);
          return _emptyListWidet();
        });
  }

  Widget _build({required BuildContext context}) {
    return Scaffold(
        appBar: AppBar(title: Text('Ayush Medical Record System')),
        body: SafeArea(
            //     child: RecordListingWidget(
            //   recordController: controller,
            // )));
            child: RecordListingWidgetV2()));
  }

  Widget _isLoading() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _emptyListWidet() {
    return Scaffold(
      appBar: AppBar(title: Text('Ayush Medical Record System')),
      body: SafeArea(
        child: ListView(
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
            CachedNetworkImage(
              imageUrl:
                  'https://firebasestorage.googleapis.com/v0/b/sheraa-95d17.appspot.com/o/no-data-image.jpg?alt=media',
              placeholder: (context, url) =>
                  CircularProgressIndicator(), // Placeholder widget while loading
              errorWidget: (context, url, error) => Icon(Icons.error),
              height: 250,
              width: 250,
            ),
          ],
        ),
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
    /*return recordController.obx((state) {
      if (state == null) {
        return _isLoading();
      }
      return _build(context);
    }, onLoading: _isLoading(), onEmpty: _emptyListWidet());*/
    return _build(context);
  }

  Widget _build(BuildContext context) {
    return ListView(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomButton(
              text: 'Export',
              color: Colors.green,
              onPressed: () => _selectMonth(context),
            ),
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
                DataCell(Text(
                  Utility.appDisplayDate(data.opd_date),
                )),
                DataCell(Text(Utility.getOpdTypeInString(data.opd_type))),
                DataCell(Text('${data.old_total}')),
                DataCell(Text('${data.new_total}')),
                DataCell(CustomButton(
                  text: 'Edit',
                  color: Colors.green,
                  onPressed: () {
                    // print(data.id);
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

  Widget _isLoading() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Future<void> _selectMonth(BuildContext context) async {
    showMonthPicker(
      context,
      onSelected: (month, year) {
        recordController.updatedMonth(month, year);
      },
      initialSelectedMonth: DateTime.now().month,
      initialSelectedYear: DateTime.now().year,
      // firstEnabledMonth: 3,
      // lastEnabledMonth: 10,
      firstYear: 2023,
      //  lastYear: DateTime.now().year,
      selectButtonText: 'OK',
      cancelButtonText: 'Cancel',
      textColor: Colors.white,
    );
  }
}

class RecordListingWidgetV2 extends StatefulWidget {
  RecordListingWidgetV2({super.key});

  @override
  State<RecordListingWidgetV2> createState() => _RecordListingWidgetV2State();
}

class _RecordListingWidgetV2State extends State<RecordListingWidgetV2> {
  final RecordListingController recordController =
      Get.put(RecordListingController());
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    print('hii init');

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        recordController.fetchRecordsV2();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return recordController.obx((state) {
      return Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomButton(
                text: 'Export',
                color: Colors.green,
                onPressed: () => _selectMonth(context),
              ),
              CustomButton(
                text: 'Add OPD',
                color: Colors.green,
                onPressed: () {
                  Get.toNamed(Routes.INITIAL, arguments: {'new_opd': true});
                },
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width:
                    600, // Adjust this value to control the width of your table
                child: Obx(() => ListView.builder(
                      controller: _scrollController,
                      itemCount: recordController.records.length +
                          (recordController.isLoading.value ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index == recordController.records.length) {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                        var data = recordController.records[index];
                        return Column(
                          children: [
                            if (index == 0)
                              const Row(children: [
                                Expanded(
                                  child: Text('Date'),
                                ),
                                Expanded(
                                  child: Text('OPD Type'),
                                ),
                                Expanded(
                                  child: Text('Old Total'),
                                ),
                                Expanded(
                                  child: Text('New Total'),
                                ),
                                Expanded(
                                  child: Text('Action'),
                                ),
                              ]),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                      Utility.appDisplayDate(data.opd_date)),
                                ),
                                Expanded(
                                  child: Text(Utility.getOpdTypeInString(
                                      data.opd_type)),
                                ),
                                Expanded(
                                  child: Text('${data.old_total}'),
                                ),
                                Expanded(
                                  child: Text('${data.new_total}'),
                                ),
                                Container(
                                  width: 100,
                                  child: CustomButton(
                                    text: 'Edit',
                                    color: Colors.green,
                                    onPressed: () {
                                      Get.toNamed(Routes.INITIAL,
                                          arguments: {'id': data.id});
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Divider(), // Horizontal divider
                          ],
                        );
                      },
                    )),
              ),
            ),
          ),
        ],
      );
    });
  }

  Future<void> _selectMonth(BuildContext context) async {
    showMonthPicker(
      context,
      onSelected: (month, year) {
        recordController.updatedMonth(month, year);
      },
      initialSelectedMonth: DateTime.now().month,
      initialSelectedYear: DateTime.now().year,
      // firstEnabledMonth: 3,
      // lastEnabledMonth: 10,
      firstYear: 2023,
      //  lastYear: DateTime.now().year,
      selectButtonText: 'OK',
      cancelButtonText: 'Cancel',
      textColor: Colors.white,
    );
  }
}

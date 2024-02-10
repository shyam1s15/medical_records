import 'package:medical_records/mappers/date_converter.dart';

class RecordListingModel {
  int id;
  int new_total;
  int old_total;
  DateTime opd_date;
  int opd_type;
  DateTime updatedAt;

  RecordListingModel(
      {required this.id,
      required this.new_total,
      required this.old_total,
      required this.opd_date,
      required this.opd_type,
      required this.updatedAt});

  RecordListingModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        new_total = json['new_total'] ?? 0,
        old_total = json['old_total'] ?? 0,
        opd_date = json['opd_date'] != null
            ? const DateField().parse(json['opd_date'])
            : DateTime.now(),
        opd_type = json['opd_type'] ?? 1,
        updatedAt = json['updatedAt'] != null
            ? const DateField().parse(json['updatedAt'])
            : DateTime.now();
}

class RecordListingGroupModel {
  List<RecordListingModel> recordList;

  RecordListingGroupModel({required this.recordList});

  RecordListingGroupModel.fromJson(Map<String, dynamic> json)
      : recordList = (json['results'] as List<dynamic>?)
                ?.map((e) =>
                    RecordListingModel.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [];
}

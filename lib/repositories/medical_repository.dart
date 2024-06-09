import 'package:medical_records/dtos/requestDtos/MedicalRecordModel.dart';
import 'package:medical_records/dtos/requestDtos/page_dto.dart';
import 'package:medical_records/dtos/responseDtos/record_listing_dto.dart';
import 'package:medical_records/dtos/responseDtos/string_response_dto.dart';
import 'package:medical_records/models/response_model.dart';
import 'package:medical_records/services/api_request.dart';
import 'package:medical_records/services/networking/api_service.dart';
import 'package:medical_records/shared/typedef.dart';
import 'package:medical_records/shared/utils/date_utils.dart';

class MedicalRepository {
  final ApiService api;

  MedicalRepository(this.api);

  /*String fromJson(Map<String, dynamic> json) {
    return json['content'] ?? "";
  }*/

  Future<ResponseModel<StringResponseModel>> saveRecord(
      MedicalRecordModel body) async {
    ResponseModel<StringResponseModel> resp =
        await api.post<StringResponseModel>(StringResponseModel.fromJson,
            endpoint: ApiRequest.INSERT_UPDATE_RECORD_API, body: body.toJson());
    return resp;
  }

  Future<ResponseModel<RecordListingGroupModel?>> fetchRecords(
      PageModel? body) async {
    if (body == null) {
      body = new PageModel(page: new PageInfoModel(pageId: 0));
    }

    ResponseModel<RecordListingGroupModel?> resp = await api
        .post<RecordListingGroupModel?>(RecordListingGroupModel.fromJson,
            endpoint: ApiRequest.FETCH_RECORDS_API, body: body.toJson());
    return resp;
  }

  Future<ResponseModel<MedicalRecordModel>> fetchSingleRecord(
      int receivedID) async {
    ResponseModel<MedicalRecordModel> resp = await api.post<MedicalRecordModel>(
        MedicalRecordModel.fromJson,
        body: {'id': receivedID},
        endpoint: ApiRequest.DETAIL_RECORD_API);
    return resp;
  }

  Future<void> downloadExcel(DateTime dateTime) async {
    JSON body = {'opd_date': DateUtil.appBackendDate(dateTime)};
    await api.downloadAndSaveExcel(endpoint: ApiRequest.DOWNLOAD_EXCEL, body: body);
  }
}

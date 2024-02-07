import 'package:medical_records/dtos/requestDtos/MedicalRecordModel.dart';
import 'package:medical_records/models/response_model.dart';
import 'package:medical_records/services/networking/api_service.dart';

class MedicalRepository {
  final ApiService api;

  MedicalRepository(this.api);
  
  String fromJson(dynamic json) {
    return json.toString();
  }

  Future<ResponseModel> saveRecord(MedicalRecordModel body) async {
    print(body.toJson());
    ResponseModel<String> resp = await api.post<String>(
        fromJson,
        endpoint:
            "https://asia-south1-sheraa-95d17.cloudfunctions.net/insert_medical_record/insert_medical_record",
        body: body.toJson());
    print(resp.errorInfo.error);
    print(resp.errorInfo.message);
    print(resp.content);
    return ResponseModel(
        content: null,
        errorInfo: ErrorInfo(error: 1, message: "static data"));
  }
}

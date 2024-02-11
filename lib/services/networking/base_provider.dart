import 'package:get/get_connect.dart';
import 'package:medical_records/services/networking/interseptors/request_interceptors.dart';
import 'package:medical_records/services/networking/interseptors/response_interceptors.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    //httpClient.baseUrl = ApiConstants.baseUrl;
    httpClient.addRequestModifier(requestInterceptor);
    httpClient.addResponseModifier(responseInterceptor);
    httpClient.timeout = const Duration(seconds: 15);
  }
}

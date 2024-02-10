import 'dart:convert';

import 'package:medical_records/dtos/requestDtos/MedicalRecordModel.dart';
import 'package:medical_records/models/response_model.dart';
import 'package:medical_records/services/networking/base_provider.dart';
import 'package:medical_records/shared/typedef.dart';

class ApiService {
  final BaseProvider _baseProvider;

  ApiService(this._baseProvider);

  Future<JSON> get<T>({
    required String endpoint,
    JSON? query,
    Map<String, String>? headers,
    bool requiresAuthToken = false,
  }) async {
    var customHeaders = {
      'Accept': 'application/json',
      requiresAuthToken ? 'Authorization' : '': '',
    };

    if (headers != null) {
      customHeaders.addAll(headers);
    }

    final response =
        await _baseProvider.get(endpoint, headers: customHeaders, query: query);

    return response.body;
  }

  Future<ResponseModel<T>> post<T>(
    T Function(Map<String, dynamic> json) fromJson, {
    required String endpoint,
    JSON? body,
    JSON? query,
    Map<String, String>? headers,
    bool requiresAuthToken = false,
  }) async {
    var customHeaders = {
      'Accept': 'application/json',
      if (requiresAuthToken) 'Authorization': '',
      'Access-Control-Allow-Origin': '*', // Allow requests from any origin
      'Access-Control-Allow-Methods':
          'OPTIONS, GET, PUT, POST, DELETE, OPTIONS', // Specify allowed methods
      'Access-Control-Allow-Headers':
          'Content-Type, Authorization', // Specify allowed request headers
    };

    if (headers != null) {
      customHeaders.addAll(headers);
    }

    final response = await _baseProvider.post(endpoint, body,
        headers: customHeaders, query: query);
    //dynamic responseBody = json.decode(response.body);

    // return response.body;
    ResponseModel<T> apiResp = ResponseModel.fromJson(response.body, fromJson);
    return apiResp;
  }

  Future<JSON> put<T>({
    required String endpoint,
    JSON? body,
    JSON? query,
    Map<String, String>? headers,
    bool requiresAuthToken = false,
  }) async {
    var customHeaders = {
      'Accept': 'application/json',
      requiresAuthToken ? 'Authorization' : '': '',
    };

    if (headers != null) {
      customHeaders.addAll(headers);
    }

    final response = await _baseProvider.put(endpoint, body,
        headers: customHeaders, query: query);

    return response.body;
  }

  Future<JSON> delete<T>({
    required String endpoint,
    JSON? body,
    JSON? query,
    Map<String, String>? headers,
    bool requiresAuthToken = false,
  }) async {
    var customHeaders = {
      'Accept': 'application/json',
      requiresAuthToken ? 'Authorization' : '': '',
    };

    if (headers != null) {
      customHeaders.addAll(headers);
    }

    final response = await _baseProvider.delete(endpoint,
        headers: customHeaders, query: query);

    return response.body;
  }
}

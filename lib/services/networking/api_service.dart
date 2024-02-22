import 'dart:convert' show jsonEncode, utf8;
import 'dart:io';
import 'dart:typed_data';

import 'package:file_saver/file_saver.dart';
import 'package:medical_records/dtos/requestDtos/MedicalRecordModel.dart';
import 'package:medical_records/models/response_model.dart';
import 'package:medical_records/services/app_preference_service.dart';
import 'package:medical_records/services/networking/base_provider.dart';
import 'package:medical_records/shared/typedef.dart';
import 'dart:html' as html;
import 'package:http/http.dart' as http;
import 'package:medical_records/shared/utils/Utility.dart';

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
      'user-token': AppPreferences.userToken ?? '',
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

  Future<void> downloadAndSaveExcel({
    required String endpoint,
    JSON? body,
    JSON? query,
  }) async {
    var customHeaders = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'user-token': AppPreferences.userToken ?? '',
    };
    try {
      //final response = await _baseProvider.post(endpoint, body,
      //   headers: customHeaders, query: query);
      final response = await http.post(Uri.parse(endpoint),
          headers: customHeaders, body: jsonEncode(body));

      // print(response.bodyString);
      // List<int>? bytes = await response.bodyBytes?.fold<List<int>>(
      //   <int>[],
      //   (previous, element) => previous..addAll(element),
      // );
      // utf8.decode(response.bodyString!.runes.toList())

      //   Uint8List excelData = utf8.encode(response.bodyString!) as Uint8List;

      //   FileSaver.instance.saveFile(
      //       bytes: excelData,
      //       mimeType: MimeType.openDocSheets,
      //       name: 'example.xlsx');
      // }

      if (response.statusCode == 200) {
        String fileName = body?['opd_date'] ?? "output";
        fileName += ".xlsx";
        
        final blob = html.Blob([response.bodyBytes]);
        final url = html.Url.createObjectUrlFromBlob(blob);
        final anchor = html.document.createElement('a') as html.AnchorElement
          ..href = url
          ..style.display = 'none'
          ..download = fileName;
        html.document.body!.children.add(anchor);

        anchor.click();

        html.document.body!.children.remove(anchor);
        html.Url.revokeObjectUrl(url);
      }
    } catch (e) {
      print(e);
    }
  }
}

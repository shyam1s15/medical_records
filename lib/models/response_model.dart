import 'dart:convert';

class ResponseModel<T> {
  T content;
  ErrorInfo errorInfo;

  ResponseModel({required this.content, required this.errorInfo});

  factory ResponseModel.fromJson(Map<String, dynamic> json, T Function(dynamic json) fromJson) {
    // Parse error info
    ErrorInfo errorInfo = ErrorInfo.fromJson(json['response']);

    // Parse content based on its type
    dynamic parsedContent = fromJson(json['content']);

    return ResponseModel<T>(
      content: parsedContent,
      errorInfo: errorInfo,
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T content) toJson) {
    final Map<String, dynamic> data = {};
    data['content'] = toJson(this.content);
    data['response'] = this.errorInfo.toJson();
    return data;
  }
}

class ErrorInfo {
  int error;
  String message;

  ErrorInfo({required this.error, required this.message});

  ErrorInfo.fromJson(Map<String, dynamic> json)
      : this.error = json['error'] ?? 0,
        this.message = json['message'] ?? "";

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    return data;
  }
}

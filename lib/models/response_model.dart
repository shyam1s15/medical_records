
class ResponseModel {
  dynamic content;
  ErrorInfo errorInfo;

  ResponseModel({this.content, required this.errorInfo});

  ResponseModel.fromJson(Map<String, dynamic> json) :
    this.content = json['content'],
    this.errorInfo = ErrorInfo.fromJson(json['response']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    data['error'] = this.errorInfo;
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

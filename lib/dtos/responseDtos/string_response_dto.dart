class StringResponseModel {

  String stringModel;

  StringResponseModel({required this.stringModel });

  StringResponseModel.fromJson(Map<String, dynamic> json) :
      this.stringModel = json['content'];
}
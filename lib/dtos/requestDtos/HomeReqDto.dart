class HomeRequestModel {
  int? id;
  String? name;
  DateTime createdAt;

  HomeRequestModel({this.id, this.name, required this.createdAt});

  HomeRequestModel.fromJson(Map<String, dynamic> json)
      : this.id = json['id'],
        this.name = json['name'],
        this.createdAt = json['created_at'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    return data;
  }
}

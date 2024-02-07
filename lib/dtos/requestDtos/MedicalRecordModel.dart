import 'dart:convert';

class MedicalRecordModel {
  List<Group> groups;
  int? id;
  String opdDate;
  int opdType;
  String updatedAt;

  MedicalRecordModel({
    required this.groups,
    this.id,
    required this.opdDate,
    required this.opdType,
    required this.updatedAt,
  });

  factory MedicalRecordModel.fromJson(Map<String, dynamic> json) {
    return MedicalRecordModel(
      groups: List<Group>.from(json['groups'].map((group) => Group.fromJson(group))),
      id: json['id'],
      opdDate: json['opd_date'],
      opdType: json['opd_type'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'groups': groups.map((group) => group.toJson()).toList(),
      'id': id,
      'opd_date': opdDate,
      'opd_type': opdType,
      'updated_at': updatedAt,
    };
  }
}

class Group {
  String name;
  int newFemale;
  int newMale;
  int oldFemale;
  int oldMale;

  Group({
    required this.name,
    required this.newMale,
    required this.newFemale,
    required this.oldMale,
    required this.oldFemale,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      name: json['name'],
      newFemale: json['new_female'],
      newMale: json['new_male'],
      oldFemale: json['old_female'],
      oldMale: json['old_male'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'new_female': newFemale,
      'new_male': newMale,
      'old_female': oldFemale,
      'old_male': oldMale,
    };
  }
}

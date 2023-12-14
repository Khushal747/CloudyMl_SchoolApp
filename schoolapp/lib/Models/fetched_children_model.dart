// To parse this JSON data, do
//
//     final fetchedChildrenModel = fetchedChildrenModelFromJson(jsonString);

import 'dart:convert';

FetchedChildrenModel fetchedChildrenModelFromJson(String str) => FetchedChildrenModel.fromJson(json.decode(str));

String fetchedChildrenModelToJson(FetchedChildrenModel data) => json.encode(data.toJson());

class FetchedChildrenModel {
    bool? status;
    String? message;
    Data? data;

    FetchedChildrenModel({
        this.status,
        this.message,
        this.data,
    });

    factory FetchedChildrenModel.fromJson(Map<String, dynamic> json) => FetchedChildrenModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    String? id;
    int? rollNumber;
    String? name;
    int? dataClass;
    String? section;
    String? batch;
    String? school;
    String? gender;
    String? email;
    String? password;
    String? phoneNumber;
    String? address;
    String? parentsId;
    String? role;
    bool? isDeleted;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    Data({
        this.id,
        this.rollNumber,
        this.name,
        this.dataClass,
        this.section,
        this.batch,
        this.school,
        this.gender,
        this.email,
        this.password,
        this.phoneNumber,
        this.address,
        this.parentsId,
        this.role,
        this.isDeleted,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        rollNumber: json["rollNumber"],
        name: json["name"],
        dataClass: json["class"],
        section: json["section"],
        batch: json["batch"],
        school: json["school"],
        gender: json["gender"],
        email: json["email"],
        password: json["password"],
        phoneNumber: json["phoneNumber"],
        address: json["address"],
        parentsId: json["parentsID"],
        role: json["role"],
        isDeleted: json["isDeleted"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "rollNumber": rollNumber,
        "name": name,
        "class": dataClass,
        "section": section,
        "batch": batch,
        "school": school,
        "gender": gender,
        "email": email,
        "password": password,
        "phoneNumber": phoneNumber,
        "address": address,
        "parentsID": parentsId,
        "role": role,
        "isDeleted": isDeleted,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

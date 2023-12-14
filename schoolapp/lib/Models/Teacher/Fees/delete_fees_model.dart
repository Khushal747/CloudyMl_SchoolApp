// To parse this JSON data, do
//
//     final deleteFeesDetailsModel = deleteFeesDetailsModelFromJson(jsonString);

import 'dart:convert';

DeleteFeesDetailsModel deleteFeesDetailsModelFromJson(String str) =>
    DeleteFeesDetailsModel.fromJson(json.decode(str));

String deleteFeesDetailsModelToJson(DeleteFeesDetailsModel data) =>
    json.encode(data.toJson());

class DeleteFeesDetailsModel {
  bool? status;
  String? message;

  DeleteFeesDetailsModel({
    this.status,
    this.message,
  });

  factory DeleteFeesDetailsModel.fromJson(Map<String, dynamic> json) =>
      DeleteFeesDetailsModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}

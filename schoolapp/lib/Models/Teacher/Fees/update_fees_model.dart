import 'dart:convert';

UpdateFeesDetailsModel updateFeesDetailsModelFromJson(String str) =>
    UpdateFeesDetailsModel.fromJson(json.decode(str));

String updateFeesDetailsModelToJson(UpdateFeesDetailsModel data) =>
    json.encode(data.toJson());

class UpdateFeesDetailsModel {
  bool? status;
  String? message;
  Data? data;

  UpdateFeesDetailsModel({
    this.status,
    this.message,
    this.data,
  });

  factory UpdateFeesDetailsModel.fromJson(Map<String, dynamic> json) =>
      UpdateFeesDetailsModel(
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
  int? dataClass;
  int? tuitionFees;
  int? admissionFees;
  int? examinationFees;
  int? libraryFees;
  int? transportFees;
  int? miscellaneousFees;
  int? totalFees;
  int? discountedFees;
  int? discountAmount;
  double? discountPercentage;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Data({
    this.id,
    this.dataClass,
    this.tuitionFees,
    this.admissionFees,
    this.examinationFees,
    this.libraryFees,
    this.transportFees,
    this.miscellaneousFees,
    this.totalFees,
    this.discountedFees,
    this.discountAmount,
    this.discountPercentage,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        dataClass: json["class"],
        tuitionFees: json["tuitionFees"],
        admissionFees: json["admissionFees"],
        examinationFees: json["examinationFees"],
        libraryFees: json["libraryFees"],
        transportFees: json["transportFees"],
        miscellaneousFees: json["miscellaneousFees"],
        totalFees: json["totalFees"],
        discountedFees: json["discountedFees"],
        discountAmount: json["discountAmount"],
        discountPercentage: json["discountPercentage"]?.toDouble(),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "class": dataClass,
        "tuitionFees": tuitionFees,
        "admissionFees": admissionFees,
        "examinationFees": examinationFees,
        "libraryFees": libraryFees,
        "transportFees": transportFees,
        "miscellaneousFees": miscellaneousFees,
        "totalFees": totalFees,
        "discountedFees": discountedFees,
        "discountAmount": discountAmount,
        "discountPercentage": discountPercentage,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

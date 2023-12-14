import 'dart:convert';

StudentFeesDetailsModel studentFeesDetailsModelFromJson(String str) =>
    StudentFeesDetailsModel.fromJson(json.decode(str));

String studentFeesDetailsModelToJson(StudentFeesDetailsModel data) =>
    json.encode(data.toJson());

class StudentFeesDetailsModel {
  bool? status;
  String? message;
  List<SingleFeeModel>? data;

  StudentFeesDetailsModel({
    this.status,
    this.message,
    this.data,
  });

  factory StudentFeesDetailsModel.fromJson(Map<String, dynamic> json) =>
      StudentFeesDetailsModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<SingleFeeModel>.from(
                json["data"]!.map((x) => SingleFeeModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class SingleFeeModel {
  String? id;
  int? datumClass;
  int? tuitionFees;
  int? admissionFees;
  int? examinationFees;
  int? libraryFees;
  int? transportFees;
  int? miscellaneousFees;
  double? totalFees;
  double? discountedFees;
  int? discountAmount;
  double? discountPercentage;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  SingleFeeModel({
    this.id,
    this.datumClass,
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

  factory SingleFeeModel.fromJson(Map<String, dynamic> json) => SingleFeeModel(
        id: json["_id"],
        datumClass: json["class"],
        tuitionFees: json["tuitionFees"],
        admissionFees: json["admissionFees"],
        examinationFees: json["examinationFees"],
        libraryFees: json["libraryFees"],
        transportFees: json["transportFees"],
        miscellaneousFees: json["miscellaneousFees"],
        totalFees: json["totalFees"]?.toDouble(),
        discountedFees: json["discountedFees"]?.toDouble(),
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
        "class": datumClass,
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

import 'dart:convert';

UploadFeesResponseModel uploadFeesResponseModelFromJson(String str) =>
    UploadFeesResponseModel.fromJson(json.decode(str));

String uploadFeesResponseModelToJson(UploadFeesResponseModel data) =>
    json.encode(data.toJson());

class UploadFeesResponseModel {
  int? uploadFeesResponseModelClass;
  int? admissionFees;
  int? tuitionFees;
  int? examinationFees;
  int? libraryFees;
  int? transportFees;
  int? miscellaneousFees;
  int? discountAmount;

  UploadFeesResponseModel({
    this.uploadFeesResponseModelClass,
    this.admissionFees,
    this.tuitionFees,
    this.examinationFees,
    this.libraryFees,
    this.transportFees,
    this.miscellaneousFees,
    this.discountAmount,
  });

  factory UploadFeesResponseModel.fromJson(Map<String, dynamic> json) =>
      UploadFeesResponseModel(
        uploadFeesResponseModelClass: json["class"],
        admissionFees: json["admissionFees"],
        tuitionFees: json["tuitionFees"],
        examinationFees: json["examinationFees"],
        libraryFees: json["libraryFees"],
        transportFees: json["transportFees"],
        miscellaneousFees: json["miscellaneousFees"],
        discountAmount: json["discountAmount"],
      );

  Map<String, dynamic> toJson() => {
        "class": uploadFeesResponseModelClass,
        "admissionFees": admissionFees,
        "tuitionFees": tuitionFees,
        "examinationFees": examinationFees,
        "libraryFees": libraryFees,
        "transportFees": transportFees,
        "miscellaneousFees": miscellaneousFees,
        "discountAmount": discountAmount,
      };
}

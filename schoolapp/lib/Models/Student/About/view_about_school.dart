import 'dart:convert';

AboutSchoolResponseModel aboutSchoolResponseModelFromJson(String str) =>
    AboutSchoolResponseModel.fromJson(json.decode(str));

String aboutSchoolResponseModelToJson(AboutSchoolResponseModel data) =>
    json.encode(data.toJson());

class AboutSchoolResponseModel {
  bool? status;
  String? message;
  Data? data;

  AboutSchoolResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory AboutSchoolResponseModel.fromJson(Map<String, dynamic> json) =>
      AboutSchoolResponseModel(
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
  String? schoolName;
  String? schoolAddress;
  String? websiteLink;
  String? schoolEmailId;
  String? aboutSchool;
  String? coreValues;
  CoverPic? rulesAndRegulation;
  CoverPic? profilePic;
  CoverPic? coverPic;
  String? principalOffice;
  String? admissionDepartment;
  String? enquiryDepartment;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Data({
    this.schoolName,
    this.schoolAddress,
    this.websiteLink,
    this.schoolEmailId,
    this.aboutSchool,
    this.coreValues,
    this.rulesAndRegulation,
    this.profilePic,
    this.coverPic,
    this.principalOffice,
    this.admissionDepartment,
    this.enquiryDepartment,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        schoolName: json["schoolName"],
        schoolAddress: json["schoolAddress"],
        websiteLink: json["websiteLink"],
        schoolEmailId: json["schoolEmailId"],
        aboutSchool: json["aboutSchool"],
        coreValues: json["coreValues"],
        rulesAndRegulation: json["rulesAndRegulation"] == null
            ? null
            : CoverPic.fromJson(json["rulesAndRegulation"]),
        profilePic: json["profilePic"] == null
            ? null
            : CoverPic.fromJson(json["profilePic"]),
        coverPic: json["coverPic"] == null
            ? null
            : CoverPic.fromJson(json["coverPic"]),
        principalOffice: json["principalOffice"],
        admissionDepartment: json["admissionDepartment"],
        enquiryDepartment: json["enquiryDepartment"],
        id: json["_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "schoolName": schoolName,
        "schoolAddress": schoolAddress,
        "websiteLink": websiteLink,
        "schoolEmailId": schoolEmailId,
        "aboutSchool": aboutSchool,
        "coreValues": coreValues,
        "rulesAndRegulation": rulesAndRegulation?.toJson(),
        "profilePic": profilePic?.toJson(),
        "coverPic": coverPic?.toJson(),
        "principalOffice": principalOffice,
        "admissionDepartment": admissionDepartment,
        "enquiryDepartment": enquiryDepartment,
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class CoverPic {
  String? link;
  String? originalImage;
  String? path;

  CoverPic({
    this.link,
    this.originalImage,
    this.path,
  });

  factory CoverPic.fromJson(Map<String, dynamic> json) => CoverPic(
        link: json["link"],
        originalImage: json["originalImage"],
        path: json["path"],
      );

  Map<String, dynamic> toJson() => {
        "link": link,
        "originalImage": originalImage,
        "path": path,
      };
}

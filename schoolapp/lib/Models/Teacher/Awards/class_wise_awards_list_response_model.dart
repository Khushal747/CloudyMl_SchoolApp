import 'dart:convert';

ClassWiseAwardsListOfStudentsResponseModel
    classWiseAwardsListOfStudentsResponseModelFromJson(String str) =>
        ClassWiseAwardsListOfStudentsResponseModel.fromJson(json.decode(str));

String classWiseAwardsListOfStudentsResponseModelToJson(
        ClassWiseAwardsListOfStudentsResponseModel data) =>
    json.encode(data.toJson());

class ClassWiseAwardsListOfStudentsResponseModel {
  bool? status;
  String? message;
  List<Datum>? data;

  ClassWiseAwardsListOfStudentsResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory ClassWiseAwardsListOfStudentsResponseModel.fromJson(
          Map<String, dynamic> json) =>
      ClassWiseAwardsListOfStudentsResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  String? id;
  String? studentName;
  String? studentId;
  String? schoolName;
  int? datumClass;
  String? section;
  String? rollNumber;
  List<AwardList>? awardList;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Datum({
    this.id,
    this.studentName,
    this.studentId,
    this.schoolName,
    this.datumClass,
    this.section,
    this.rollNumber,
    this.awardList,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        studentName: json["studentName"],
        studentId: json["studentId"],
        schoolName: json["schoolName"],
        datumClass: json["class"],
        section: json["section"],
        rollNumber: json["rollNumber"],
        awardList: json["awardList"] == null
            ? []
            : List<AwardList>.from(
                json["awardList"]!.map((x) => AwardList.fromJson(x))),
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
        "studentName": studentName,
        "studentId": studentId,
        "schoolName": schoolName,
        "class": datumClass,
        "section": section,
        "rollNumber": rollNumber,
        "awardList": awardList == null
            ? []
            : List<dynamic>.from(awardList!.map((x) => x.toJson())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class AwardList {
  String? certificationHeading;
  DateTime? certificationDate;
  String? link;
  String? originalImage;
  String? path;
  String? id;

  AwardList({
    this.certificationHeading,
    this.certificationDate,
    this.link,
    this.originalImage,
    this.path,
    this.id,
  });

  factory AwardList.fromJson(Map<String, dynamic> json) => AwardList(
        certificationHeading: json["certificationHeading"],
        certificationDate: json["certificationDate"] == null
            ? null
            : DateTime.parse(json["certificationDate"]),
        link: json["link"],
        originalImage: json["originalImage"],
        path: json["path"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "certificationHeading": certificationHeading,
        "certificationDate": certificationDate?.toIso8601String(),
        "link": link,
        "originalImage": originalImage,
        "path": path,
        "_id": id,
      };
}

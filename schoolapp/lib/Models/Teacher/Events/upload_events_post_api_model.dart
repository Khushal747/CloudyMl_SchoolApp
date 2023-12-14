// To parse this JSON data, do
//
//     final teacherUploadEventsModel = teacherUploadEventsModelFromJson(jsonString);

import 'dart:convert';

TeacherUploadEventsModel teacherUploadEventsModelFromJson(String str) =>
    TeacherUploadEventsModel.fromJson(json.decode(str));

String teacherUploadEventsModelToJson(TeacherUploadEventsModel data) =>
    json.encode(data.toJson());

class TeacherUploadEventsModel {
  bool? status;
  String? message;
  Link? link;

  TeacherUploadEventsModel({
    this.status,
    this.message,
    this.link,
  });

  factory TeacherUploadEventsModel.fromJson(Map<String, dynamic> json) =>
      TeacherUploadEventsModel(
        status: json["status"],
        message: json["message"],
        link: json["link"] == null ? null : Link.fromJson(json["link"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "link": link?.toJson(),
      };
}

class Link {
  String? eventName;
  List<UploadedImage>? uploadedImage;
  String? description;
  DateTime? date;
  String? year;
  String? month;
  String? eventTime;
  String? status;
  String? eligibleClass;
  String? remark;
  String? schoolName;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Link({
    this.eventName,
    this.uploadedImage,
    this.description,
    this.date,
    this.year,
    this.month,
    this.eventTime,
    this.status,
    this.eligibleClass,
    this.remark,
    this.schoolName,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        eventName: json["eventName"],
        uploadedImage: json["uploadedImage"] == null
            ? []
            : List<UploadedImage>.from(
                json["uploadedImage"]!.map((x) => UploadedImage.fromJson(x))),
        description: json["description"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        year: json["year"],
        month: json["month"],
        eventTime: json["eventTime"],
        status: json["status"],
        eligibleClass: json["eligibleClass"],
        remark: json["remark"],
        schoolName: json["schoolName"],
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
        "eventName": eventName,
        "uploadedImage": uploadedImage == null
            ? []
            : List<dynamic>.from(uploadedImage!.map((x) => x.toJson())),
        "description": description,
        "date": date?.toIso8601String(),
        "year": year,
        "month": month,
        "eventTime": eventTime,
        "status": status,
        "eligibleClass": eligibleClass,
        "remark": remark,
        "schoolName": schoolName,
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class UploadedImage {
  String? originalName;
  String? path;
  String? key;
  String? link;
  int? count;
  String? previosName;
  String? id;

  UploadedImage({
    this.originalName,
    this.path,
    this.key,
    this.link,
    this.count,
    this.previosName,
    this.id,
  });

  factory UploadedImage.fromJson(Map<String, dynamic> json) => UploadedImage(
        originalName: json["originalName"],
        path: json["path"],
        key: json["key"],
        link: json["link"],
        count: json["count"],
        previosName: json["previosName"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "originalName": originalName,
        "path": path,
        "key": key,
        "link": link,
        "count": count,
        "previosName": previosName,
        "_id": id,
      };
}

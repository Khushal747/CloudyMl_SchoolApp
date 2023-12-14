import 'dart:convert';

ViewNoticeResponseModel viewNoticeResponseModelFromJson(String str) =>
    ViewNoticeResponseModel.fromJson(json.decode(str));

String viewNoticeResponseModelToJson(ViewNoticeResponseModel data) =>
    json.encode(data.toJson());

class ViewNoticeResponseModel {
  bool? status;
  String? message;
  Data? data;

  ViewNoticeResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory ViewNoticeResponseModel.fromJson(Map<String, dynamic> json) =>
      ViewNoticeResponseModel(
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
  String? studentId;
  String? schoolName;
  List<NoticeList>? noticeList;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Data({
    this.id,
    this.studentId,
    this.schoolName,
    this.noticeList,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        studentId: json["studentId"],
        schoolName: json["schoolName"],
        noticeList: json["noticeList"] == null
            ? []
            : List<NoticeList>.from(
                json["noticeList"]!.map((x) => NoticeList.fromJson(x))),
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
        "studentId": studentId,
        "schoolName": schoolName,
        "noticeList": noticeList == null
            ? []
            : List<dynamic>.from(noticeList!.map((x) => x.toJson())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class NoticeList {
  String? id;
  String? heading;
  String? description;
  String? schoolName;
  DateTime? date;
  bool? read;
  String? link;
  String? originalImage;
  String? path;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  NoticeList({
    this.id,
    this.heading,
    this.description,
    this.schoolName,
    this.date,
    this.read,
    this.link,
    this.originalImage,
    this.path,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory NoticeList.fromJson(Map<String, dynamic> json) => NoticeList(
        id: json["_id"],
        heading: json["heading"],
        description: json["description"],
        schoolName: json["schoolName"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        read: json["read"],
        link: json["link"],
        originalImage: json["originalImage"],
        path: json["path"],
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
        "heading": heading,
        "description": description,
        "schoolName": schoolName,
        "date": date?.toIso8601String(),
        "read": read,
        "link": link,
        "originalImage": originalImage,
        "path": path,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

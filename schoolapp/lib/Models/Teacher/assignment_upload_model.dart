import 'dart:convert';

TeacherAssignmentUploadModel teacherAssignmentUploadModelFromJson(String str) =>
    TeacherAssignmentUploadModel.fromJson(json.decode(str));

String teacherAssignmentUploadModelToJson(TeacherAssignmentUploadModel data) =>
    json.encode(data.toJson());

class TeacherAssignmentUploadModel {
  bool? status;
  String? message;
  Link? link;

  TeacherAssignmentUploadModel({
    this.status,
    this.message,
    this.link,
  });

  factory TeacherAssignmentUploadModel.fromJson(Map<String, dynamic> json) =>
      TeacherAssignmentUploadModel(
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
  DateTime? date;
  int? linkClass;
  String? section;
  String? subject;
  String? topic;
  DateTime? lastDateOfSubmit;
  int? rollNumber;
  String? link;
  String? image;
  String? path;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Link({
    this.date,
    this.linkClass,
    this.section,
    this.subject,
    this.topic,
    this.lastDateOfSubmit,
    this.rollNumber,
    this.link,
    this.image,
    this.path,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        linkClass: json["class"],
        section: json["section"],
        subject: json["subject"],
        topic: json["topic"],
        lastDateOfSubmit: json["lastDateOfSubmit"] == null
            ? null
            : DateTime.parse(json["lastDateOfSubmit"]),
        rollNumber: json["rollNumber"],
        link: json["link"],
        image: json["image"],
        path: json["path"],
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
        "date": date?.toIso8601String(),
        "class": linkClass,
        "section": section,
        "subject": subject,
        "topic": topic,
        "lastDateOfSubmit": lastDateOfSubmit?.toIso8601String(),
        "rollNumber": rollNumber,
        "link": link,
        "image": image,
        "path": path,
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

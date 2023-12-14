import 'dart:convert';

TeacherSeeOwnAssignmentsListModel teacherSeeOwnAssignmentsListModelFromJson(
        String str) =>
    TeacherSeeOwnAssignmentsListModel.fromJson(json.decode(str));

String teacherSeeOwnAssignmentsListModelToJson(
        TeacherSeeOwnAssignmentsListModel data) =>
    json.encode(data.toJson());

class TeacherSeeOwnAssignmentsListModel {
  bool? status;
  String? message;
  List<Datum>? data;

  TeacherSeeOwnAssignmentsListModel({
    this.status,
    this.message,
    this.data,
  });

  factory TeacherSeeOwnAssignmentsListModel.fromJson(
          Map<String, dynamic> json) =>
      TeacherSeeOwnAssignmentsListModel(
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
  DateTime? date;
  int? datumClass;
  String? section;
  String? subject;
  String? topic;
  DateTime? lastDateOfSubmit;
  String? link;
  String? originalImage;
  String? path;
  List<SubmittedStudentId>? submittedStudentId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Datum({
    this.id,
    this.date,
    this.datumClass,
    this.section,
    this.subject,
    this.topic,
    this.lastDateOfSubmit,
    this.link,
    this.originalImage,
    this.path,
    this.submittedStudentId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        datumClass: json["class"],
        section: json["section"],
        subject: json["subject"],
        topic: json["topic"],
        lastDateOfSubmit: json["lastDateOfSubmit"] == null
            ? null
            : DateTime.parse(json["lastDateOfSubmit"]),
        link: json["link"],
        originalImage: json["originalImage"],
        path: json["path"],
        submittedStudentId: json["submittedStudentId"] == null
            ? []
            : List<SubmittedStudentId>.from(json["submittedStudentId"]!
                .map((x) => SubmittedStudentId.fromJson(x))),
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
        "date": date?.toIso8601String(),
        "class": datumClass,
        "section": section,
        "subject": subject,
        "topic": topic,
        "lastDateOfSubmit": lastDateOfSubmit?.toIso8601String(),
        "link": link,
        "originalImage": originalImage,
        "path": path,
        "submittedStudentId": submittedStudentId == null
            ? []
            : List<dynamic>.from(submittedStudentId!.map((x) => x.toJson())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class SubmittedStudentId {
  String? id;
  DateTime? date;
  String? name;
  int? submittedStudentIdClass;
  String? section;
  String? subject;
  int? rollNumber;
  String? link;
  String? originalImage;
  String? path;
  String? studentId;
  String? isDone;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  SubmittedStudentId({
    this.id,
    this.date,
    this.name,
    this.submittedStudentIdClass,
    this.section,
    this.subject,
    this.rollNumber,
    this.link,
    this.originalImage,
    this.path,
    this.studentId,
    this.isDone,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory SubmittedStudentId.fromJson(Map<String, dynamic> json) =>
      SubmittedStudentId(
        id: json["_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        name: json["name"],
        submittedStudentIdClass: json["class"],
        section: json["section"],
        subject: json["subject"],
        rollNumber: json["rollNumber"],
        link: json["link"],
        originalImage: json["originalImage"],
        path: json["path"],
        studentId: json["studentId"],
        isDone: json["isDone"],
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
        "date": date?.toIso8601String(),
        "name": name,
        "class": submittedStudentIdClass,
        "section": section,
        "subject": subject,
        "rollNumber": rollNumber,
        "link": link,
        "originalImage": originalImage,
        "path": path,
        "studentId": studentId,
        "isDone": isDone,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

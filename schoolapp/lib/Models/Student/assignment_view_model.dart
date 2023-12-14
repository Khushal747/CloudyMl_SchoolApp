import 'dart:convert';

StudentViewAssignmentModel studentViewAssignmentModelFromJson(String str) =>
    StudentViewAssignmentModel.fromJson(json.decode(str));

String studentViewAssignmentModelToJson(StudentViewAssignmentModel data) =>
    json.encode(data.toJson());

class StudentViewAssignmentModel {
  bool? status;
  String? message;
  List<Datum>? data;

  StudentViewAssignmentModel({
    this.status,
    this.message,
    this.data,
  });

  factory StudentViewAssignmentModel.fromJson(Map<String, dynamic> json) =>
      StudentViewAssignmentModel(
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
  List<dynamic>? submittedStudentId;
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
            : List<dynamic>.from(json["submittedStudentId"]!.map((x) => x)),
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
            : List<dynamic>.from(submittedStudentId!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

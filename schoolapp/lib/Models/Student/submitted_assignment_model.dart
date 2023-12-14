import 'dart:convert';

StudentSubmittedAssignmentModel studentSubmittedAssignmentModelFromJson(
        String str) =>
    StudentSubmittedAssignmentModel.fromJson(json.decode(str));

String studentSubmittedAssignmentModelToJson(
        StudentSubmittedAssignmentModel data) =>
    json.encode(data.toJson());

class StudentSubmittedAssignmentModel {
  bool? status;
  String? message;
  List<Datum>? data;

  StudentSubmittedAssignmentModel({
    this.status,
    this.message,
    this.data,
  });

  factory StudentSubmittedAssignmentModel.fromJson(Map<String, dynamic> json) =>
      StudentSubmittedAssignmentModel(
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
  String? name;
  int? datumClass;
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

  Datum({
    this.id,
    this.date,
    this.name,
    this.datumClass,
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        name: json["name"],
        datumClass: json["class"],
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
        "class": datumClass,
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

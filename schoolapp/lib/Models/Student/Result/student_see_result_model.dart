// To parse this JSON data, do
//
//     final studentResultResponseModel = studentResultResponseModelFromJson(jsonString);

import 'dart:convert';

StudentResultResponseModel studentResultResponseModelFromJson(String str) =>
    StudentResultResponseModel.fromJson(json.decode(str));

String studentResultResponseModelToJson(StudentResultResponseModel data) =>
    json.encode(data.toJson());

class StudentResultResponseModel {
  bool? status;
  String? message;
  Data? data;

  StudentResultResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory StudentResultResponseModel.fromJson(Map<String, dynamic> json) =>
      StudentResultResponseModel(
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
  int? dataClass;
  String? section;
  int? rollNumber;
  String? studentName;
  String? examType;
  List<Subject>? subjects;
  String? percentage;
  String? overAllGrade;
  String? result;
  List<dynamic>? seplimentri;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Data({
    this.id,
    this.studentId,
    this.schoolName,
    this.dataClass,
    this.section,
    this.rollNumber,
    this.studentName,
    this.examType,
    this.subjects,
    this.percentage,
    this.overAllGrade,
    this.result,
    this.seplimentri,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        studentId: json["studentId"],
        schoolName: json["schoolName"],
        dataClass: json["class"],
        section: json["section"],
        rollNumber: json["rollNumber"],
        studentName: json["studentName"],
        examType: json["examType"],
        subjects: json["subjects"] == null
            ? []
            : List<Subject>.from(
                json["subjects"]!.map((x) => Subject.fromJson(x))),
        percentage: json["percentage"],
        overAllGrade: json["overAllGrade"],
        result: json["result"],
        seplimentri: json["seplimentri"] == null
            ? []
            : List<dynamic>.from(json["seplimentri"]!.map((x) => x)),
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
        "class": dataClass,
        "section": section,
        "rollNumber": rollNumber,
        "studentName": studentName,
        "examType": examType,
        "subjects": subjects == null
            ? []
            : List<dynamic>.from(subjects!.map((x) => x.toJson())),
        "percentage": percentage,
        "overAllGrade": overAllGrade,
        "result": result,
        "seplimentri": seplimentri == null
            ? []
            : List<dynamic>.from(seplimentri!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class Subject {
  String? subject;
  int? marks;
  int? outOffMarks;
  int? passingMarks;
  String? grade;
  String? comment;
  String? id;

  Subject({
    this.subject,
    this.marks,
    this.outOffMarks,
    this.passingMarks,
    this.grade,
    this.comment,
    this.id,
  });

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        subject: json["subject"],
        marks: json["marks"],
        outOffMarks: json["outOffMarks"],
        passingMarks: json["passingMarks"],
        grade: json["grade"],
        comment: json["comment"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "subject": subject,
        "marks": marks,
        "outOffMarks": outOffMarks,
        "passingMarks": passingMarks,
        "grade": grade,
        "comment": comment,
        "_id": id,
      };
}

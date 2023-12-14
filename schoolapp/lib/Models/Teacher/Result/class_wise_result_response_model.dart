import 'dart:convert';

ClassWiseResultResponseModel classWiseResultResponseModelFromJson(String str) =>
    ClassWiseResultResponseModel.fromJson(json.decode(str));

String classWiseResultResponseModelToJson(ClassWiseResultResponseModel data) =>
    json.encode(data.toJson());

class ClassWiseResultResponseModel {
  bool? status;
  String? message;
  List<Datum>? data;

  ClassWiseResultResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory ClassWiseResultResponseModel.fromJson(Map<String, dynamic> json) =>
      ClassWiseResultResponseModel(
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
  List<dynamic>? seplimentri;
  String? id;
  String? studentId;
  String? schoolName;
  int? datumClass;
  String? section;
  int? rollNumber;
  String? studentName;
  String? examType;
  List<Subject>? subjects;
  String? percentage;
  String? overAllGrade;
  String? result;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Datum({
    this.seplimentri,
    this.id,
    this.studentId,
    this.schoolName,
    this.datumClass,
    this.section,
    this.rollNumber,
    this.studentName,
    this.examType,
    this.subjects,
    this.percentage,
    this.overAllGrade,
    this.result,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        seplimentri: json["seplimentri"] == null
            ? []
            : List<dynamic>.from(json["seplimentri"]!.map((x) => x)),
        id: json["_id"],
        studentId: json["studentId"],
        schoolName: json["schoolName"],
        datumClass: json["class"],
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
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "seplimentri": seplimentri == null
            ? []
            : List<dynamic>.from(seplimentri!.map((x) => x)),
        "_id": id,
        "studentId": studentId,
        "schoolName": schoolName,
        "class": datumClass,
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

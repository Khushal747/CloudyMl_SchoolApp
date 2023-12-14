// To parse this JSON data, do
//
//     final eventRegisteredStudentListResponseModel = eventRegisteredStudentListResponseModelFromJson(jsonString);

import 'dart:convert';

EventRegisteredStudentListResponseModel
    eventRegisteredStudentListResponseModelFromJson(String str) =>
        EventRegisteredStudentListResponseModel.fromJson(json.decode(str));

String eventRegisteredStudentListResponseModelToJson(
        EventRegisteredStudentListResponseModel data) =>
    json.encode(data.toJson());

class EventRegisteredStudentListResponseModel {
  bool? status;
  String? message;
  Data? data;

  EventRegisteredStudentListResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory EventRegisteredStudentListResponseModel.fromJson(
          Map<String, dynamic> json) =>
      EventRegisteredStudentListResponseModel(
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
  String? schoolName;
  String? eventName;
  List<UploadedImage>? uploadedImage;
  String? description;
  String? eventTime;
  DateTime? date;
  String? year;
  String? month;
  String? eligibleClass;
  String? status;
  String? remark;
  List<StudentList>? studentList;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Data({
    this.id,
    this.schoolName,
    this.eventName,
    this.uploadedImage,
    this.description,
    this.eventTime,
    this.date,
    this.year,
    this.month,
    this.eligibleClass,
    this.status,
    this.remark,
    this.studentList,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        schoolName: json["schoolName"],
        eventName: json["eventName"],
        uploadedImage: json["uploadedImage"] == null
            ? []
            : List<UploadedImage>.from(
                json["uploadedImage"]!.map((x) => UploadedImage.fromJson(x))),
        description: json["description"],
        eventTime: json["eventTime"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        year: json["year"],
        month: json["month"],
        eligibleClass: json["eligibleClass"],
        status: json["status"],
        remark: json["remark"],
        studentList: json["studentList"] == null
            ? []
            : List<StudentList>.from(
                json["studentList"]!.map((x) => StudentList.fromJson(x))),
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
        "schoolName": schoolName,
        "eventName": eventName,
        "uploadedImage": uploadedImage == null
            ? []
            : List<dynamic>.from(uploadedImage!.map((x) => x.toJson())),
        "description": description,
        "eventTime": eventTime,
        "date": date?.toIso8601String(),
        "year": year,
        "month": month,
        "eligibleClass": eligibleClass,
        "status": status,
        "remark": remark,
        "studentList": studentList == null
            ? []
            : List<dynamic>.from(studentList!.map((x) => x.toJson())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class StudentList {
  String? studentId;
  int? rollNumber;
  String? studentName;
  int? studentListClass;
  String? section;
  String? gender;
  String? email;
  String? phoneNumber;
  String? id;

  StudentList({
    this.studentId,
    this.rollNumber,
    this.studentName,
    this.studentListClass,
    this.section,
    this.gender,
    this.email,
    this.phoneNumber,
    this.id,
  });

  factory StudentList.fromJson(Map<String, dynamic> json) => StudentList(
        studentId: json["studentId"],
        rollNumber: json["rollNumber"],
        studentName: json["studentName"],
        studentListClass: json["class"],
        section: json["section"],
        gender: json["gender"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "studentId": studentId,
        "rollNumber": rollNumber,
        "studentName": studentName,
        "class": studentListClass,
        "section": section,
        "gender": gender,
        "email": email,
        "phoneNumber": phoneNumber,
        "_id": id,
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

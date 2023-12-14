import 'dart:convert';

AttendanceSubmitModel attendanceSubmitModelFromJson(String str) =>
    AttendanceSubmitModel.fromJson(json.decode(str));

String attendanceSubmitModelToJson(AttendanceSubmitModel data) =>
    json.encode(data.toJson());

class AttendanceSubmitModel {
  bool? status;
  String? message;
  Data? data;

  AttendanceSubmitModel({
    this.status,
    this.message,
    this.data,
  });

  factory AttendanceSubmitModel.fromJson(Map<String, dynamic> json) =>
      AttendanceSubmitModel(
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
  DateTime? date;
  int? dataClass;
  String? section;
  String? day;
  int? month;
  int? year;
  int? tarikh;
  List<AttendanceStoreModel>? data;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Data({
    this.date,
    this.dataClass,
    this.section,
    this.day,
    this.month,
    this.year,
    this.tarikh,
    this.data,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        dataClass: json["class"],
        section: json["section"],
        day: json["day"],
        month: json["month"],
        year: json["year"],
        tarikh: json["tarikh"],
        data: json["data"] == null
            ? []
            : List<AttendanceStoreModel>.from(json["data"]!.map((x) => AttendanceStoreModel.fromJson(x))),
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
        "class": dataClass,
        "section": section,
        "day": day,
        "month": month,
        "year": year,
        "tarikh": tarikh,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class AttendanceStoreModel {
  String? name;
  int? rollNumber;
  String? attendance;
  String? id;

  AttendanceStoreModel({
    this.name,
    this.rollNumber,
    this.attendance,
    this.id,
  });

  factory AttendanceStoreModel.fromJson(Map<String, dynamic> json) => AttendanceStoreModel(
        name: json["name"],
        rollNumber: json["rollNumber"],
        attendance: json["attendance"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "rollNumber": rollNumber,
        "attendance": attendance,
        "_id": id,
      };
}

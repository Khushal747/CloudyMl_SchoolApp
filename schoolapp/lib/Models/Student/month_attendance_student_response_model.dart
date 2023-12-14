import 'dart:convert';

StudentMonthlyAttendanceModel studentMonthlyAttendanceModelFromJson(
        String str) =>
    StudentMonthlyAttendanceModel.fromJson(json.decode(str));

String studentMonthlyAttendanceModelToJson(
        StudentMonthlyAttendanceModel data) =>
    json.encode(data.toJson());

class StudentMonthlyAttendanceModel {
  bool? status;
  String? message;
  Data? data;

  StudentMonthlyAttendanceModel({
    this.status,
    this.message,
    this.data,
  });

  factory StudentMonthlyAttendanceModel.fromJson(Map<String, dynamic> json) =>
      StudentMonthlyAttendanceModel(
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
  List<Datum>? data;
  int? totalDays;
  int? absent;
  int? present;

  Data({
    this.data,
    this.totalDays,
    this.absent,
    this.present,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        totalDays: json["totalDays"],
        absent: json["absent"],
        present: json["present"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "totalDays": totalDays,
        "absent": absent,
        "present": present,
      };
}

class Datum {
  String? date;
  String? attendance;
  String? day;

  Datum({
    this.date,
    this.attendance,
    this.day,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        date: json["date"],
        attendance: json["attendance"],
        day: json["day"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "attendance": attendance,
        "day": day,
      };
}

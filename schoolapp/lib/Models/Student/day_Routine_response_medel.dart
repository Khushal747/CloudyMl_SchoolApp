
import 'dart:convert';

StudentEachdayRoutineModel studentEachdayRoutineModelFromJson(String str) => StudentEachdayRoutineModel.fromJson(json.decode(str));

String studentEachdayRoutineModelToJson(StudentEachdayRoutineModel data) => json.encode(data.toJson());

class StudentEachdayRoutineModel {
    bool? status;
    String? message;
    Data? data;

    StudentEachdayRoutineModel({
        this.status,
        this.message,
        this.data,
    });

    factory StudentEachdayRoutineModel.fromJson(Map<String, dynamic> json) => StudentEachdayRoutineModel(
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
    Heading? heading;
    List<DataTimeTable>? timeTable;

    Data({
        this.heading,
        this.timeTable,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        heading: json["heading"] == null ? null : Heading.fromJson(json["heading"]),
        timeTable: json["timeTable"] == null ? [] : List<DataTimeTable>.from(json["timeTable"]!.map((x) => DataTimeTable.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "heading": heading?.toJson(),
        "timeTable": timeTable == null ? [] : List<dynamic>.from(timeTable!.map((x) => x.toJson())),
    };
}

class Heading {
    String? period;
    String? start;
    String? end;
    String? subject;
    String? teacherName;

    Heading({
        this.period,
        this.start,
        this.end,
        this.subject,
        this.teacherName,
    });

    factory Heading.fromJson(Map<String, dynamic> json) => Heading(
        period: json["period"],
        start: json["start"],
        end: json["end"],
        subject: json["subject"],
        teacherName: json["teacherName"],
    );

    Map<String, dynamic> toJson() => {
        "period": period,
        "start": start,
        "end": end,
        "subject": subject,
        "teacherName": teacherName,
    };
}

class DataTimeTable {
    String? id;
    int? timeTableClass;
    String? day;
    String? section;
    List<TimeTableTimeTable>? timeTable;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    DataTimeTable({
        this.id,
        this.timeTableClass,
        this.day,
        this.section,
        this.timeTable,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory DataTimeTable.fromJson(Map<String, dynamic> json) => DataTimeTable(
        id: json["_id"],
        timeTableClass: json["class"],
        day: json["day"],
        section: json["section"],
        timeTable: json["timeTable"] == null ? [] : List<TimeTableTimeTable>.from(json["timeTable"]!.map((x) => TimeTableTimeTable.fromJson(x))),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "class": timeTableClass,
        "day": day,
        "section": section,
        "timeTable": timeTable == null ? [] : List<dynamic>.from(timeTable!.map((x) => x.toJson())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

class TimeTableTimeTable {
    Period? period;
    String? id;

    TimeTableTimeTable({
        this.period,
        this.id,
    });

    factory TimeTableTimeTable.fromJson(Map<String, dynamic> json) => TimeTableTimeTable(
        period: json["period"] == null ? null : Period.fromJson(json["period"]),
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "period": period?.toJson(),
        "_id": id,
    };
}

class Period {
    int? period;
    String? startTime;
    String? endTime;
    String? subject;
    String? teacherName;

    Period({
        this.period,
        this.startTime,
        this.endTime,
        this.subject,
        this.teacherName,
    });

    factory Period.fromJson(Map<String, dynamic> json) => Period(
        period: json["period"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        subject: json["subject"],
        teacherName: json["teacherName"],
    );

    Map<String, dynamic> toJson() => {
        "period": period,
        "startTime": startTime,
        "endTime": endTime,
        "subject": subject,
        "teacherName": teacherName,
    };
}

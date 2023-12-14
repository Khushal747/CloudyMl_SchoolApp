import 'dart:convert';

ExamRoutineResponseModel examRoutineResponseModelFromJson(String str) => ExamRoutineResponseModel.fromJson(json.decode(str));

String examRoutineResponseModelToJson(ExamRoutineResponseModel data) => json.encode(data.toJson());

class ExamRoutineResponseModel {
    bool? status;
    String? message;
    Data? data;

    ExamRoutineResponseModel({
        this.status,
        this.message,
        this.data,
    });

    factory ExamRoutineResponseModel.fromJson(Map<String, dynamic> json) => ExamRoutineResponseModel(
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
    int? dataClass;
    String? examType;
    List<ExamDetail>? examDetails;
    String? remarks;
    String? comments;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    Data({
        this.id,
        this.schoolName,
        this.dataClass,
        this.examType,
        this.examDetails,
        this.remarks,
        this.comments,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        schoolName: json["schoolName"],
        dataClass: json["class"],
        examType: json["examType"],
        examDetails: json["examDetails"] == null ? [] : List<ExamDetail>.from(json["examDetails"]!.map((x) => ExamDetail.fromJson(x))),
        remarks: json["remarks"],
        comments: json["comments"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "schoolName": schoolName,
        "class": dataClass,
        "examType": examType,
        "examDetails": examDetails == null ? [] : List<dynamic>.from(examDetails!.map((x) => x.toJson())),
        "remarks": remarks,
        "comments": comments,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

class ExamDetail {
    DateTime? date;
    String? subject;
    String? time;
    String? id;

    ExamDetail({
        this.date,
        this.subject,
        this.time,
        this.id,
    });

    factory ExamDetail.fromJson(Map<String, dynamic> json) => ExamDetail(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        subject: json["subject"],
        time: json["time"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "date": date?.toIso8601String(),
        "subject": subject,
        "time": time,
        "_id": id,
    };
}

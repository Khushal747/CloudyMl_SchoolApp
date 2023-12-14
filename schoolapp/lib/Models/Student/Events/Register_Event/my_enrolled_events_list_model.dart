import 'dart:convert';

StudentMyEnrolledEventsResponseModel
    studentMyEnrolledEventsResponseModelFromJson(String str) =>
        StudentMyEnrolledEventsResponseModel.fromJson(json.decode(str));

String studentMyEnrolledEventsResponseModelToJson(
        StudentMyEnrolledEventsResponseModel data) =>
    json.encode(data.toJson());

class StudentMyEnrolledEventsResponseModel {
  bool? status;
  String? message;
  Data? data;

  StudentMyEnrolledEventsResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory StudentMyEnrolledEventsResponseModel.fromJson(
          Map<String, dynamic> json) =>
      StudentMyEnrolledEventsResponseModel(
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
  List<EventList>? eventList;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Data({
    this.id,
    this.studentId,
    this.eventList,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        studentId: json["studentId"],
        eventList: json["eventList"] == null
            ? []
            : List<EventList>.from(
                json["eventList"]!.map((x) => EventList.fromJson(x))),
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
        "eventList": eventList == null
            ? []
            : List<dynamic>.from(eventList!.map((x) => x.toJson())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class EventList {
  String? eventId;
  String? eventName;
  String? description;
  String? eventTime;
  String? eligibleClass;
  DateTime? eventDate;
  String? id;

  EventList({
    this.eventId,
    this.eventName,
    this.description,
    this.eventTime,
    this.eligibleClass,
    this.eventDate,
    this.id,
  });

  factory EventList.fromJson(Map<String, dynamic> json) => EventList(
        eventId: json["eventId"],
        eventName: json["eventName"],
        description: json["description"],
        eventTime: json["eventTime"],
        eligibleClass: json["eligibleClass"],
        eventDate: json["eventDate"] == null
            ? null
            : DateTime.parse(json["eventDate"]),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "eventId": eventId,
        "eventName": eventName,
        "description": description,
        "eventTime": eventTime,
        "eligibleClass": eligibleClass,
        "eventDate": eventDate?.toIso8601String(),
        "_id": id,
      };
}

import 'dart:convert';

StudentEnrollEventEligibilityResponseModel
    studentEnrollEventEligibilityResponseModelFromJson(String str) =>
        StudentEnrollEventEligibilityResponseModel.fromJson(json.decode(str));

String studentEnrollEventEligibilityResponseModelToJson(
        StudentEnrollEventEligibilityResponseModel data) =>
    json.encode(data.toJson());

class StudentEnrollEventEligibilityResponseModel {
  bool? status;
  String? message;
  Data? data;

  StudentEnrollEventEligibilityResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory StudentEnrollEventEligibilityResponseModel.fromJson(
          Map<String, dynamic> json) =>
      StudentEnrollEventEligibilityResponseModel(
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
  String? eventName;
  String? description;
  String? eventTime;
  String? eligibleClass;
  int? rollNumber;
  String? name;
  int? dataClass;
  String? section;
  String? batch;
  String? school;
  String? gender;
  String? email;
  String? phoneNumber;
  String? address;

  Data({
    this.eventName,
    this.description,
    this.eventTime,
    this.eligibleClass,
    this.rollNumber,
    this.name,
    this.dataClass,
    this.section,
    this.batch,
    this.school,
    this.gender,
    this.email,
    this.phoneNumber,
    this.address,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        eventName: json["eventName"],
        description: json["description"],
        eventTime: json["eventTime"],
        eligibleClass: json["eligibleClass"],
        rollNumber: json["rollNumber"],
        name: json["name"],
        dataClass: json["class"],
        section: json["section"],
        batch: json["batch"],
        school: json["school"],
        gender: json["gender"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "eventName": eventName,
        "description": description,
        "eventTime": eventTime,
        "eligibleClass": eligibleClass,
        "rollNumber": rollNumber,
        "name": name,
        "class": dataClass,
        "section": section,
        "batch": batch,
        "school": school,
        "gender": gender,
        "email": email,
        "phoneNumber": phoneNumber,
        "address": address,
      };
}

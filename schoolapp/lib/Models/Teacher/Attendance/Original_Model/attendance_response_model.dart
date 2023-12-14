// import 'dart:convert';

// AttendanceResponseModel attendanceResponseModelFromJson(String str) => AttendanceResponseModel.fromJson(json.decode(str));

// String attendanceResponseModelToJson(AttendanceResponseModel data) => json.encode(data.toJson());

// class AttendanceResponseModel {
//     bool? status;
//     String? message;
//     List<SingleAttendanceModel>? data;

//     AttendanceResponseModel({
//         this.status,
//         this.message,
//         this.data,
//     });

//     factory AttendanceResponseModel.fromJson(Map<String, dynamic> json) => AttendanceResponseModel(
//         status: json["status"],
//         message: json["message"],
//         data: json["data"] == null ? [] : List<SingleAttendanceModel>.from(json["data"]!.map((x) => SingleAttendanceModel.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {

//         "status": status,
//         "message": message,
//         "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
//     };
// }

// class SingleAttendanceModel {
//     String? id;
//     int? rollNumber;
//     String? name;
//     int? SingleAttendanceModelClass;
//     String? section;
//     String? batch;
//     String? school;
//     String? gender;
//     String? email;
//     String? password;
//     String? phoneNumber;
//     String? address;
//     String? parentsId;
//     String? role;
//     bool? isDeleted;
//     DateTime? createdAt;
//     DateTime? updatedAt;
//     int? v;
//     String? attendance;

//     SingleAttendanceModel({
//         this.id,
//         this.rollNumber,
//         this.name,
//         this.SingleAttendanceModelClass,
//         this.section,
//         this.batch,
//         this.school,
//         this.gender,
//         this.email,
//         this.password,
//         this.phoneNumber,
//         this.address,
//         this.parentsId,
//         this.role,
//         this.isDeleted,
//         this.createdAt,
//         this.updatedAt,
//         this.v,
//         this.attendance,
//     });

//     factory SingleAttendanceModel.fromJson(Map<String, dynamic> json) => SingleAttendanceModel(
//         id: json["_id"],
//         rollNumber: json["rollNumber"],
//         name: json["name"],
//         SingleAttendanceModelClass: json["class"],
//         section: json["section"],
//         batch: json["batch"],
//         school: json["school"],
//         gender: json["gender"],
//         email: json["email"],
//         password: json["password"],
//         phoneNumber: json["phoneNumber"],
//         address: json["address"],
//         parentsId: json["parentsID"],
//         role: json["role"],
//         isDeleted: json["isDeleted"],
//         createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//     );

//     Map<String, dynamic> toJson() => {
//         "_id": id,
//         "rollNumber": rollNumber,
//         "name": name,
//         "class": SingleAttendanceModelClass,
//         "section": section,
//         "batch": batch,
//         "school": school,
//         "gender": gender,
//         "email": email,
//         "password": password,
//         "phoneNumber": phoneNumber,
//         "address": address,
//         "parentsID": parentsId,
//         "role": role,
//         "isDeleted": isDeleted,
//         "createdAt": createdAt?.toIso8601String(),
//         "updatedAt": updatedAt?.toIso8601String(),
//         "__v": v,
//     };
// }


import 'dart:convert';

AttendanceResponseModel attendanceResponseModelFromJson(String str) =>
    AttendanceResponseModel.fromJson(json.decode(str));

String attendanceResponseModelToJson(AttendanceResponseModel data) =>
    json.encode(data.toJson());

class AttendanceResponseModel {
  String? attendanceDate;
  String? className;
  String? section;
  List<SingleAttendanceModel>? data;

  AttendanceResponseModel({
    this.className,
    this.section,
    this.data,
    this.attendanceDate,
  });

  factory AttendanceResponseModel.fromJson(Map<String, dynamic> json) =>
      AttendanceResponseModel(
        className: json["class"],
        section: json["section"],
        attendanceDate: json["date"],
        data: json["data"] == null
            ? []
            : List<SingleAttendanceModel>.from(
                json["data"]!.map((x) => SingleAttendanceModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "class": className,
        "section": section,
        "date": attendanceDate,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class SingleAttendanceModel {
  int? rollNumber;
  String? name;
  String? attendance;

  SingleAttendanceModel({
    this.rollNumber,
    this.name,
    this.attendance,
  });

  factory SingleAttendanceModel.fromJson(Map<String, dynamic> json) =>
      SingleAttendanceModel(
        rollNumber: json["rollNumber"],
        name: json["name"],
        attendance: json["attendance"],
      );

  Map<String, dynamic> toJson() =>
      {"rollNumber": rollNumber, "name": name, "attendance": attendance};
}

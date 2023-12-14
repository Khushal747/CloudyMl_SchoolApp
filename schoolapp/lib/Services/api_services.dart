import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:school_management_system/Models/fetched_children_model.dart';
import 'package:school_management_system/Services/firebase_api_services.dart';
import 'package:school_management_system/Services/shared_services.dart';
import '../Models/Student/About/view_about_school.dart';
import '../Models/Student/Awards/view_awards_response_model.dart';
import '../Models/Student/Events/Register_Event/eligibility_check_get_api_response_model.dart';
import '../Models/Student/Events/Register_Event/my_enrolled_events_list_model.dart';
import '../Models/Student/Events/view_events_response_model.dart';
import '../Models/Student/Exam/exam_routine_response_model.dart';
import '../Models/Student/Fees/student_fee_response_model.dart';
import '../Models/Student/Gallery/view_gallery_response_model.dart';
import '../Models/Student/Notice/view_notice_response_model.dart';
import '../Models/Student/Result/student_see_result_model.dart';
import '../Models/Teacher/Attendance/attendance_submit_model.dart';
import '../Models/Teacher/Awards/class_wise_awards_list_response_model.dart';
import '../Models/Teacher/Events/event_registered_student_list_model.dart';
import '../Models/Teacher/Events/upload_events_post_api_model.dart';
import '../Models/Teacher/Fees/delete_fees_model.dart';
import '../Models/Teacher/Fees/update_fees_model.dart';
import '../Models/Teacher/Fees/upload_fees_model.dart';
import '../Models/Student/Student_Upload_Assignment.dart';
import '../Models/Student/assignment_view_model.dart';
import '../Models/Student/month_attendance_student_response_model.dart';
import '../Models/Student/submitted_assignment_model.dart';
import '../Models/Teacher/Assignment_upload_model.dart';
import '../Models/Teacher/Gallery/upload_gallery.dart';
import '../Models/Teacher/Result/class_wise_result_response_model.dart';
import '../Models/Teacher/assignment_submitted_students_model.dart';
import '../Models/Teacher/given_assignmens_list_model.dart';
import '../Models/Teacher/Attendance/Original_Model/attendance_response_model.dart';
import '../Models/Student/day_Routine_response_medel.dart';
import '../Models/login_response_model.dart';
import '../Models/Student/week_attendance_student_model.dart';
import '../constants/constants.dart';
import 'api_urls.dart';
import 'base_api_service.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;

class ApiServices {
// ....... Login  ..................................................
  static Future<bool> userLogin(
    String email,
    String password,
    String selectedrole,
    String fcmToken,
    BuildContext context,
  ) async {
    var ret = false;

    try {
      var response = await ApiBase.postRequest(
        extendedURL: ApiUrl.login,
        body: {
          "email": email,
          "password": password,
          "fcmToken": fcmToken,
          "role": selectedrole,
        },
      );

      log(response.statusCode.toString());
      log(selectedrole.toString());
      log("\n${response.body}");

      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          var responseModel = loginResponseModelFromJson(response.body);
          log(responseModel.message!);

          ret = true;
          SharedService.setLoginDetails(responseModel);
        } else {
          ret = false;
          log("not successful");
        }
      } else {
        ret = false;
        log("not successful ");
      }
    } catch (e) {
      ret = false;
      log("$e :  not successful catch");
    }

    return ret;
  }

  // Fetch UserData using Unique ID.........................................
// added by harsh to to fetchand store the child data in a new entry
  static Future<FetchedChildrenModel> childrenData(String id) async {
    // var response = ApiBase.getRequest(extendedURL: ApiUrl.childrenDataById);
//TODO DO THIS SAME TO FETCH USER DATA --harshP
    try {
      var response = await ApiBase.getRequest(
          extendedURL: "  ${ApiUrl.childrenDataById}/$id");

      log(response.statusCode.toString());
      debugPrint(response.body.toString());
      // log(selectedrole.toString());
      log("\n${response.body}");
      //TODO DO THIS SAME TO FETCH USER DATA --harshP
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          FetchedChildrenModel responseModel =
              fetchedChildrenModelFromJson(response.body);
          log(responseModel.message!);
          SharedService.setDetailsOfFetchedChild(responseModel);
          log("  this is the data in the child detils shared pref        ${SharedService.childDetails()?.data?.address.toString()}"
              as String);

          var harsh = SharedService.childDetails();
          log("  this is the data fetched from shared pref       ${harsh?.data?.address} ");
        } else {
          log("not successful");
        }
      } else {
        log("not successful ");
      }
    } catch (e) {
      log("$e :  not successful catch");
    }
    return FetchedChildrenModel();
  }

// Logout....................................................................

  static Future<bool> logout(BuildContext context) async {
    await preferences!.clear();
    FirebaseMessaging.instance.deleteToken();
    log("the fcm tocken is empty $fcmToken");
    return true;
  }
//................... Get all students of a class for taking attendance.....

  static Future<AttendanceResponseModel> takeAttendance(
    String selectedClass,
    String selectedSection,
  ) async {
    AttendanceResponseModel attendanceModel = AttendanceResponseModel();
    try {
      var response = await ApiBase.getRequest(
        extendedURL:
            "${ApiUrl.studentListForTakeAttendance}?class=$selectedClass&section=$selectedSection",
      );
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          attendanceModel = attendanceResponseModelFromJson(response.body);
        } else {
          attendanceModel = AttendanceResponseModel();
        }
      } else {
        attendanceModel = AttendanceResponseModel();
      }
    } catch (e) {
      attendanceModel = AttendanceResponseModel();
    }

    return attendanceModel;
  }

// Teacher Submit attendance (POST API)...........................................
  static Future<bool> submitAttendance(
    Map<String, dynamic> attendance,
  ) async {
    var ret = false;

    try {
      var response = await ApiBase.postRequest(
        extendedURL: ApiUrl.teacherSubmitAttendance,
        body: attendance,
      );

      log(response.statusCode.toString());
      log("${response.body}");

      if (response.statusCode == 201) {
        if (jsonDecode(response.body)['status'] == true) {
          ret = true;
        } else {
          ret = false;
          log("not successful");
        }
      } else {
        ret = false;
        log("not successful ");
      }
    } catch (e) {
      ret = false;
      log("$e :  not successful catch");
    }

    return ret;
  }

//Parent  can see his/her child's Weekly Attendance.........................................

  static Future<StudentWeeklyAttendanceModel> parentWeekAttendance() async {
    StudentWeeklyAttendanceModel WeeklyAttendance =
        StudentWeeklyAttendanceModel();
    try {
      fetchChildData();
//........................................................................
      var currentDate = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd').format(currentDate);
      String studentClass = '${SharedService.childDetails()?.data?.dataClass}';
      String section = '${SharedService.childDetails()?.data?.section}';
      String rollNumber = ' ${SharedService.childDetails()?.data?.rollNumber}';
      String date = formattedDate;
//.........................................................................

      // var date = "2023-07-30";
      // var formattedDate;
      // formattedDate = date;
      // var studentClass = "7";
      // var section = "A";
      // var rollNumber = 1;

      var queryParam =
          "${ApiUrl.weekStudentAttendance}?class=$studentClass&section=$section&rollNumber=$rollNumber&date=$date";
      var response = await ApiBase.getRequest(
        extendedURL: queryParam, // Use queryParam here
      );
      log(response.statusCode.toString());
      log(formattedDate.toString());
      log(section.toString());
      log(rollNumber.toString());
      log(studentClass);

      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          log("success");
          WeeklyAttendance =
              studentWeeklyAttendanceModelFromJson(response.body);
        } else {
          log("else 2");
          WeeklyAttendance = StudentWeeklyAttendanceModel();
        }
      } else {
        log("else 2");
        WeeklyAttendance = StudentWeeklyAttendanceModel();
      }
    } catch (e) {
      log("Catch");
      WeeklyAttendance = StudentWeeklyAttendanceModel();
    }

    return WeeklyAttendance;
  }

// Student can see his/her Weekly Attendance.........................................

  static Future<StudentWeeklyAttendanceModel> StudentWeekAttendance() async {
    StudentWeeklyAttendanceModel WeeklyAttendance =
        StudentWeeklyAttendanceModel();
    try {
//........................................................................
      var currentDate = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd').format(currentDate);
      String studentClass =
          '${SharedService.loginDetails()?.data!.data!.dataClass}';
      String section = '${SharedService.loginDetails()?.data!.data!.section}';
      String rollNumber =
          ' ${SharedService.loginDetails()?.data!.data!.rollNumber}';
      String date = formattedDate;
//.........................................................................

      // var date = "2023-07-30";
      // var formattedDate;
      // formattedDate = date;
      // var studentClass = "7";
      // var section = "A";
      // var rollNumber = 1;

      var queryParam =
          "${ApiUrl.weekStudentAttendance}?class=$studentClass&section=$section&rollNumber=$rollNumber&date=$date";
      var response = await ApiBase.getRequest(
        extendedURL: queryParam, // Use queryParam here
      );
      log(response.statusCode.toString());
      log(formattedDate.toString());
      log(section.toString());
      log(rollNumber.toString());
      log(studentClass);

      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          log("success");
          WeeklyAttendance =
              studentWeeklyAttendanceModelFromJson(response.body);
        } else {
          log("else 2");
          WeeklyAttendance = StudentWeeklyAttendanceModel();
        }
      } else {
        log("else 2");
        WeeklyAttendance = StudentWeeklyAttendanceModel();
      }
    } catch (e) {
      log("Catch");
      WeeklyAttendance = StudentWeeklyAttendanceModel();
    }

    return WeeklyAttendance;
  }

// parent view childs  Monthly Attendance.........................................

  static Future<StudentMonthlyAttendanceModel> parentMonthlyAttendance(
    final String month,
    final String year,
  ) async {
    StudentMonthlyAttendanceModel MonthlyAttendance =
        StudentMonthlyAttendanceModel();
    try {
      fetchChildData();
      String studentClass = '${SharedService.childDetails()?.data?.dataClass}';
      String section = '${SharedService.childDetails()?.data?.section}';
      String rollNumber = ' ${SharedService.childDetails()?.data?.rollNumber}';

      var queryParam =
          "${ApiUrl.monthStudentAttendance}?class=$studentClass&section=$section&rollNumber=$rollNumber&month=$month&year=$year";
      var response = await ApiBase.getRequest(
        extendedURL: queryParam, // Use queryParam here
      );

      log(response.statusCode.toString());
      log(studentClass);
      log(section.toString());
      log(rollNumber.toString());
      log(month.toString());
      log(year.toString());

      log(response.body.toString());
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          log("success");
          MonthlyAttendance =
              studentMonthlyAttendanceModelFromJson(response.body);
        } else {
          log("else 2");
          MonthlyAttendance = StudentMonthlyAttendanceModel();
        }
      } else {
        log("else 2");
        MonthlyAttendance = StudentMonthlyAttendanceModel();
      }
    } catch (e) {
      log("Catch");
      MonthlyAttendance = StudentMonthlyAttendanceModel();
    }

    return MonthlyAttendance;
  }

// Student can see his/her Monthly Attendance.........................................

  static Future<StudentMonthlyAttendanceModel> StudentMonthlyAttendance(
    final String month,
    final String year,
  ) async {
    StudentMonthlyAttendanceModel MonthlyAttendance =
        StudentMonthlyAttendanceModel();
    try {
      String studentClass =
          '${SharedService.loginDetails()?.data!.data!.dataClass}';
      String section = '${SharedService.loginDetails()?.data!.data!.section}';
      String rollNumber =
          ' ${SharedService.loginDetails()?.data!.data!.rollNumber}';

      var queryParam =
          "${ApiUrl.monthStudentAttendance}?class=$studentClass&section=$section&rollNumber=$rollNumber&month=$month&year=$year";
      var response = await ApiBase.getRequest(
        extendedURL: queryParam, // Use queryParam here
      );

      log(response.statusCode.toString());
      log(studentClass);
      log(section.toString());
      log(rollNumber.toString());
      log(month.toString());
      log(year.toString());

      log(response.body.toString());
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          log("success");
          MonthlyAttendance =
              studentMonthlyAttendanceModelFromJson(response.body);
        } else {
          log("else 2");
          MonthlyAttendance = StudentMonthlyAttendanceModel();
        }
      } else {
        log("else 2");
        MonthlyAttendance = StudentMonthlyAttendanceModel();
      }
    } catch (e) {
      log("Catch");
      MonthlyAttendance = StudentMonthlyAttendanceModel();
    }

    return MonthlyAttendance;
  }

// parent view timetable
  static Future<StudentEachdayRoutineModel> parentViewEachDayRoutine() async {
    StudentEachdayRoutineModel studentDailyRoutine =
        StudentEachdayRoutineModel();
    try {
      fetchChildData();
      String studentClass = '${SharedService.childDetails()?.data?.dataClass}';
      String section = '${SharedService.childDetails()?.data?.section}';

      var queryParam =
          "${ApiUrl.dailyRoutine}?class=$studentClass&section=$section";
      var response = await ApiBase.getRequest(
        extendedURL: queryParam,
      );
      log(response.statusCode.toString());
      log(section.toString());
      log(studentClass);

      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          log("success");
          studentDailyRoutine =
              studentEachdayRoutineModelFromJson(response.body);
        } else {
          log("else 2");
          studentDailyRoutine = StudentEachdayRoutineModel();
        }
      } else {
        log("else 2");
        studentDailyRoutine = StudentEachdayRoutineModel();
      }
    } catch (e) {
      log("Catch");
      studentDailyRoutine = StudentEachdayRoutineModel();
    }

    return studentDailyRoutine;
  }

// Student view Daily Routine.........................
  static Future<StudentEachdayRoutineModel> StudentEachDayRoutine() async {
    StudentEachdayRoutineModel studentDailyRoutine =
        StudentEachdayRoutineModel();
    try {
      String studentClass =
          '${SharedService.loginDetails()?.data!.data!.dataClass}';
      String section = '${SharedService.loginDetails()?.data!.data!.section}';

      var queryParam =
          ApiUrl.dailyRoutine + "?class=$studentClass&section=$section";
      var response = await ApiBase.getRequest(
        extendedURL: queryParam,
      );
      log(response.statusCode.toString());
      log(section.toString());
      log(studentClass);

      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          log("success");
          studentDailyRoutine =
              studentEachdayRoutineModelFromJson(response.body);
        } else {
          log("else 2");
          studentDailyRoutine = StudentEachdayRoutineModel();
        }
      } else {
        log("else 2");
        studentDailyRoutine = StudentEachdayRoutineModel();
      }
    } catch (e) {
      log("Catch");
      studentDailyRoutine = StudentEachdayRoutineModel();
    }

    return studentDailyRoutine;
  }

//  Teacher Upload Assignment...............................

  static Future<bool> TeacherAddAssignment(
    String givenDate,
    String subjectDate,
    String wclass,
    String section,
    String subject,
    String topic,
    File file,
    BuildContext context,
  ) async {
    var ret = false;

    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
          "http://${ApiUrl.baseUrl}${ApiUrl.teacherUploadAssignment}/${SharedService.loginDetails()?.data!.id}/createAssignment",
        ),
      );
      // Add headers here
      Map<String, String> headers = {
        'Authorization':
            "${SharedService.loginDetails()?.data!.token.toString()}",
      };
      request.headers.addAll(headers);

      request.fields['date'] = givenDate;
      request.fields['lastDateOfSubmit'] = subjectDate;
      request.fields['class'] = wclass;
      request.fields['section'] = section;
      request.fields['subject'] = subject;
      request.fields['topic'] = topic;

      log("SubmitDate= $subjectDate");
      log("givendate= $givenDate");
      log("class=$wclass");
      log("section=$section");
      log("topic=$topic");
      log("subject=$subject");

      if (file != null) {
        var fileStream = http.ByteStream(file.openRead());
        var length = await file.length();
        var multipartFile = http.MultipartFile(
          'file',
          fileStream.cast(),
          length,
          filename: p.basename(file.path),
        );
        request.files.add(multipartFile);
      }

      var response = await http.Response.fromStream(await request.send());

      log(response.statusCode.toString());
      log(response.body);

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        if (jsonResponse['status'] == true) {
          var teacherUploadassign =
              teacherAssignmentUploadModelFromJson(response.body);
          ret = true;
        } else {
          log(response.statusCode.toString());
          ret = false;
          log("not successful");
        }
      } else {
        log(response.statusCode.toString());
        ret = false;
        log("not successful");
      }
    } catch (e) {
      ret = false;
      log("$e : not successful catch");
    }

    return ret;
  }

// fetch the child details for the parent
  static fetchChildData() async {
    await ApiServices.childrenData(SharedService.loginDetails()
        ?.data!
        .data!
        .childrens![0]
        .toString() as String);
  }

// Parent View Children Assignment
  static Future<StudentViewAssignmentModel> parentViewAssignment() async {
    StudentViewAssignmentModel StudentCAttignment =
        StudentViewAssignmentModel();

    try {
      fetchChildData();
      var rollNumber = SharedService.childDetails()?.data?.rollNumber;
      String studentClass = '${SharedService.childDetails()?.data?.dataClass}';
      String section = '${SharedService.childDetails()?.data?.section}';
      var queryParam =
          "${ApiUrl.studentPendingAssignment}/${SharedService.childDetails()?.data?.id.toString()}/getPendingAssignment?class=$studentClass&section=$section";
      var response = await ApiBase.getRequest(
        extendedURL: queryParam,
      );

      log(response.statusCode.toString());
      log("RollNumber : ${rollNumber.toString()}");
      log(response.body.toString());
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          log("success");
          StudentCAttignment =
              studentViewAssignmentModelFromJson(response.body);
        } else {
          log("else 2");
          StudentCAttignment = StudentViewAssignmentModel();
        }
      } else {
        log("else 2");
        StudentCAttignment = StudentViewAssignmentModel();
      }
    } catch (e) {
      log("Catch");
      StudentCAttignment = StudentViewAssignmentModel();
    }

    return StudentCAttignment;
  }

//TODO UPDATED THIS FUNCTION FOR SUBMITTED ASSIGNMENT
  static Future<StudentSubmittedAssignmentModel>
      parentViewSubmittedAssignment() async {
    StudentSubmittedAssignmentModel submittedAttignment =
        StudentSubmittedAssignmentModel();
    try {
      await ApiServices.childrenData(SharedService.loginDetails()
          ?.data!
          .data!
          .childrens![0]
          .toString() as String);
      String studentClass = '${SharedService.childDetails()?.data!.dataClass}';
      String section = '${SharedService.childDetails()?.data!.section}';
      var queryParam =
          "${ApiUrl.studentSubmittedAssignment}/${SharedService.childDetails()?.data!.id.toString()}/studentseeSubmittedAssignment?class=$studentClass&section=$section";
      var response = await ApiBase.getRequest(
        extendedURL: queryParam,
      );

      log(response.body.toString());
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          log("success");
          submittedAttignment =
              studentSubmittedAssignmentModelFromJson(response.body);
        } else {
          log("else 2");
          submittedAttignment = StudentSubmittedAssignmentModel();
        }
      } else {
        log("else 2");
        submittedAttignment = StudentSubmittedAssignmentModel();
      }
    } catch (e) {
      log("Catch");
      submittedAttignment = StudentSubmittedAssignmentModel();
    }

    return submittedAttignment;
  }

// Student view assignment (Pending) ...............................................................
//TODO
  static Future<StudentViewAssignmentModel> StudentSeeAssignment() async {
    StudentViewAssignmentModel StudentCAttignment =
        StudentViewAssignmentModel();
    try {
      // var currentDate = DateTime.now();
      // String formattedDate = DateFormat('yyyy-MM-dd').format(currentDate);
      // String date = formattedDate;

      var rollNumber = SharedService.loginDetails()?.data!.data!.rollNumber;
      String studentClass =
          '${SharedService.loginDetails()?.data!.data!.dataClass}';
      String section = '${SharedService.loginDetails()?.data!.data!.section}';
      var queryParam =
          "${ApiUrl.studentPendingAssignment}/${SharedService.loginDetails()?.data!.id.toString()}/getPendingAssignment?class=$studentClass&section=$section";
      var response = await ApiBase.getRequest(
        extendedURL: queryParam,
      );

      log(response.statusCode.toString());
      log("RollNumber : ${rollNumber.toString()}");
      log(response.body.toString());
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          log("success");
          StudentCAttignment =
              studentViewAssignmentModelFromJson(response.body);
        } else {
          log("else 2");
          StudentCAttignment = StudentViewAssignmentModel();
        }
      } else {
        log("else 2");
        StudentCAttignment = StudentViewAssignmentModel();
      }
    } catch (e) {
      log("Catch");
      StudentCAttignment = StudentViewAssignmentModel();
    }

    return StudentCAttignment;
  }

//...... Teacher see own uploaded assignments ..................................
  static Future<TeacherSeeOwnAssignmentsListModel> teacherSeeOwnGivenAssignment(
    String selectesClass,
    String selectesSection,
  ) async {
    TeacherSeeOwnAssignmentsListModel teacherGivenAssignment =
        TeacherSeeOwnAssignmentsListModel();
    try {
      var queryParam =
          "${ApiUrl.teacherSeeOwnUploadedAssignments}?class=$selectesClass&section=$selectesSection";
      var response = await ApiBase.getRequest(
        extendedURL: queryParam,
      );

      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          log("success");
          teacherGivenAssignment =
              teacherSeeOwnAssignmentsListModelFromJson(response.body);
        } else {
          log("else 2");
          teacherGivenAssignment = TeacherSeeOwnAssignmentsListModel();
        }
      } else {
        log("else 2");
        teacherGivenAssignment = TeacherSeeOwnAssignmentsListModel();
      }
    } catch (e) {
      log("Catch");
      teacherGivenAssignment = TeacherSeeOwnAssignmentsListModel();
    }

    return teacherGivenAssignment;
  }
//.............Student Upload assignment..........................................

  static Future<bool> StudentUploadAssignment(
    String wclass,
    String section,
    String subject,
    String date,
    String rollNumber,
    File file,
    String assignMentID,
    BuildContext context,
  ) async {
    var ret = false;

    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
          "http://${ApiUrl.baseUrl}${ApiUrl.studentUploadAssignment}/${SharedService.loginDetails()?.data!.id}/uploadAssignmets/$assignMentID",
        ),
      );

      // Add headers here
      Map<String, String> headers = {
        'Authorization':
            "${SharedService.loginDetails()?.data!.token}", // Replace with your token
      };
      request.headers.addAll(headers);

      request.fields['date'] = date;
      request.fields['class'] = wclass;
      request.fields['section'] = section;
      request.fields['subject'] = subject;
      request.fields['rollNumber'] = rollNumber;

      log("date= $date");
      log("class=$wclass");
      log("section=$section");
      log("subject=$subject");
      log("rollNumber=$rollNumber");

      if (file != null) {
        var fileStream = http.ByteStream(file.openRead());
        var length = await file.length();
        var multipartFile = http.MultipartFile(
          'file',
          fileStream.cast(),
          length,
          filename: p.basename(file.path),
        );
        request.files.add(multipartFile);
      }

      var response = await http.Response.fromStream(await request.send());

      log(response.statusCode.toString());
      log(response.body);

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        if (jsonResponse['status'] == true) {
          var studentUploadAssign =
              studentUploadAssignmentModelFromJson(response.body);
          ret = true;
        } else {
          log(response.statusCode.toString());
          ret = false;
          log("not successful");
        }
      } else {
        log(response.statusCode.toString());
        ret = false;
        log("not successful");
      }
    } catch (e) {
      ret = false;
      log("$e : not successful catch");
    }

    return ret;
  }

// Teacher See assignment.................................................
  static Future<StudentFeesDetailsModel> teacherSeeAssign() async {
    StudentFeesDetailsModel viewAssignment = StudentFeesDetailsModel();
    try {
      var response = await ApiBase.getRequest(
        extendedURL: ApiUrl.studentFeeDetails,
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          viewAssignment = studentFeesDetailsModelFromJson(response.body);
        } else {
          viewAssignment = StudentFeesDetailsModel();
        }
      } else {
        viewAssignment = StudentFeesDetailsModel();
      }
    } catch (e) {
      viewAssignment = StudentFeesDetailsModel();
    }

    return viewAssignment;
  }

//...................  Fees View........................................

  static Future<StudentFeesDetailsModel> viewFees() async {
    StudentFeesDetailsModel feeDetails = StudentFeesDetailsModel();
    try {
      var response = await ApiBase.getRequest(
        extendedURL: ApiUrl.studentFeeDetails,
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          feeDetails = studentFeesDetailsModelFromJson(response.body);
        } else {
          feeDetails = StudentFeesDetailsModel();
        }
      } else {
        feeDetails = StudentFeesDetailsModel();
      }
    } catch (e) {
      feeDetails = StudentFeesDetailsModel();
    }

    return feeDetails;
  }
//........ Update Fees Teacher..................................................

  static Future<bool> updateFees(
    String wClass,
    String admissionFees,
    String tuitionFees,
    String examinationFees,
    String libraryFees,
    String transportFees,
    String miscellaneousFees,
  ) async {
    var ret = false;
    UpdateFeesDetailsModel updateFee = UpdateFeesDetailsModel();
    try {
      // Convert String values to int, or use a default value (0) if parsing fails.
      int admissionFeesInt = int.tryParse(admissionFees) ?? 0;
      int tuitionFeesInt = int.tryParse(tuitionFees) ?? 0;
      int examinationFeesInt = int.tryParse(examinationFees) ?? 0;
      int libraryFeesInt = int.tryParse(libraryFees) ?? 0;
      int transportFeesInt = int.tryParse(transportFees) ?? 0;
      int miscellaneousFeesInt = int.tryParse(miscellaneousFees) ?? 0;

      var response = await ApiBase.putRequest(
        extendedURL: ApiUrl.teacherUpdateFees,
        body: {
          "class": wClass,
          "admissionFees": admissionFeesInt,
          "tuitionFees": tuitionFeesInt,
          "examinationFees": examinationFeesInt,
          "libraryFees": libraryFeesInt,
          "transportFees": transportFeesInt,
          "miscellaneousFees": miscellaneousFeesInt,
          "discountAmount": 1000
        },
      );
      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          var responseModel = updateFeesDetailsModelFromJson(response.body);

          ret = true;
        } else {
          ret = false;
          log("Not Successful");
        }
      } else {
        ret = false;
        log("Not Successful");
      }
    } catch (e) {
      log("error: $e");
    }
    return ret;
  }

//......................Teacher Upload Fees....................................

  static Future<bool> uploadFees(
    String wClass,
    String admissionFees,
    String tuitionFees,
    String examinationFees,
    String libraryFees,
    String transportFees,
    String miscellaneousFees,
  ) async {
    var ret = false;
    try {
      var response = await ApiBase.postRequest(
        extendedURL: ApiUrl.teacherUploadFees,
        body: {
          "class": wClass,
          "admissionFees": admissionFees,
          "tuitionFees": tuitionFees,
          "examinationFees": examinationFees,
          "libraryFees": libraryFees,
          "transportFees": transportFees,
          "miscellaneousFees": miscellaneousFees,
          "discountAmount": 1000
        },
      );
      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          var responseModel = uploadFeesResponseModelFromJson(response.body);

          ret = true;
        } else {
          ret = false;
          log("Not Successful");
        }
      } else {
        ret = false;
        log("Not Successful");
      }
    } catch (e) {
      log("error: $e");
    }
    return ret;
  }
// ............Teacher delete fees..............................................

  static Future<bool> deleteFees(
    String wClass,
  ) async {
    var ret = false;
    try {
      var response = await ApiBase.deleteRequest(
        extendedURL: ApiUrl.teacherDeleteFees,
        body: {
          "class": wClass,
        },
      );
      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == false) {
          var responseModel = deleteFeesDetailsModelFromJson(response.body);

          ret = true;
        } else {
          ret = false;
          log("Not Successful");
        }
      } else {
        ret = false;
        log("Not Successful");
      }
    } catch (e) {
      log("error: $e");
    }
    return ret;
  }

// Student see his/her submitted assignment ....................................

  static Future<StudentSubmittedAssignmentModel>
      StudentSubmittedAssignment() async {
    StudentSubmittedAssignmentModel submittedAttignment =
        StudentSubmittedAssignmentModel();
    try {
      String studentClass =
          '${SharedService.loginDetails()?.data!.data!.dataClass}';
      String section = '${SharedService.loginDetails()?.data!.data!.section}';
      var queryParam =
          "${ApiUrl.studentSubmittedAssignment}/${SharedService.loginDetails()?.data!.id.toString()}/studentseeSubmittedAssignment?class=$studentClass&section=$section";
      var response = await ApiBase.getRequest(
        extendedURL: queryParam,
      );

      log(response.body.toString());
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          log("success");
          submittedAttignment =
              studentSubmittedAssignmentModelFromJson(response.body);
        } else {
          log("else 2");
          submittedAttignment = StudentSubmittedAssignmentModel();
        }
      } else {
        log("else 2");
        submittedAttignment = StudentSubmittedAssignmentModel();
      }
    } catch (e) {
      log("Catch");
      submittedAttignment = StudentSubmittedAssignmentModel();
    }

    return submittedAttignment;
  }
//....................... Teacher see submitted students assignments ...........

  static Future<TeacherSeeSubmittedStudentsAssignments>
      TeacherSeeSubittedStudents(
    String assignmentID,
    String wclass,
    String section,
  ) async {
    TeacherSeeSubmittedStudentsAssignments submittedStudents =
        TeacherSeeSubmittedStudentsAssignments();
    try {
      var queryParam =
          "${ApiUrl.teacherSeeSubmittedStudentsAssignments}/${SharedService.loginDetails()?.data!.id.toString()}/getAssignments/${assignmentID}?class=$wclass&section=$section";
      var response = await ApiBase.getRequest(
        extendedURL: queryParam,
      );

      log(response.body.toString());
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          log("success");
          submittedStudents =
              teacherSeeSubmittedStudentsAssignmentsFromJson(response.body);
        } else {
          log("else 2");
          submittedStudents = TeacherSeeSubmittedStudentsAssignments();
        }
      } else {
        log("else 2");
        submittedStudents = TeacherSeeSubmittedStudentsAssignments();
      }
    } catch (e) {
      log("Catch");
      submittedStudents = TeacherSeeSubmittedStudentsAssignments();
    }

    return submittedStudents;
  }
  // Attendance post...............................................

  static Future<bool> attendancePost() async {
    var ret = false;

    try {
      var response = await ApiBase.postRequest(
        extendedURL: ApiUrl.teacherAttendanceSubmit,
        body: {},
      );

      log(response.statusCode.toString());
      log("\n${response.body}");

      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          var responseModel = attendanceSubmitModelFromJson(response.body);
          log(responseModel.message!);

          ret = true;
        } else {
          ret = false;
          log("not successful");
        }
      } else {
        ret = false;
        log("not successful ");
      }
    } catch (e) {
      ret = false;
      log("$e :  not successful catch");
    }

    return ret;
  }

// Gallery Teacher Upload ...................................................
  static Future<bool> teacherUploadGallery(
    List<XFile> files,
  ) async {
    var ret = false;

    try {
      String? schoolName = SharedService.loginDetails()?.data!.data!.school;
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
          "http://${ApiUrl.baseUrl}${ApiUrl.uploadGallery}",
        ),
      );

      // Add headers here
      Map<String, String> headers = {
        'Authorization': "${SharedService.loginDetails()?.data!.token}",
      };
      request.headers.addAll(headers);

      // Add your string to the request body
      request.fields['schoolName'] = schoolName!;

      for (var file in files) {
        var fileStream = http.ByteStream(file.openRead());
        var length = await file.length();
        var multipartFile = http.MultipartFile(
          'files[]', // Use 'files[]' to indicate it's an array of files
          fileStream.cast(),
          length,
          filename: p.basename(file.path),
        );
        request.files.add(multipartFile);
      }

      var response = await http.Response.fromStream(await request.send());

      log(response.statusCode.toString());
      // log(response.body);

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        if (jsonResponse['status'] == true) {
          var teacherUploadGal = galleryUploadModelFromJson(response.body);
          ret = true;
        } else {
          log(response.statusCode.toString());
          log(response.body);
          ret = false;
          log("not successful");
        }
      } else {
        log(response.statusCode.toString());
        ret = false;
        log("not successful");
      }
    } catch (e) {
      ret = false;
      log("$e : not successful catch");
    }

    return ret;
  }

//............ View School Gallery Parents ............................................

  static Future<ViewGalleryResponseModel> parentsViewSchoolGallery() async {
    ViewGalleryResponseModel viewGalModel = ViewGalleryResponseModel();
    try {
      fetchChildData();
      var response = await ApiBase.getRequest(
        extendedURL:
            "${ApiUrl.viewSchoolGallery}?schoolName=${SharedService.childDetails()?.data!.school}",
      );
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          viewGalModel = viewGalleryResponseModelFromJson(response.body);
        } else {
          viewGalModel = ViewGalleryResponseModel();
        }
      } else {
        viewGalModel = ViewGalleryResponseModel();
      }
    } catch (e) {
      viewGalModel = ViewGalleryResponseModel();
    }

    return viewGalModel;
  }

//............ View School Gallery............................................

  static Future<ViewGalleryResponseModel> viewSchoolGallery() async {
    ViewGalleryResponseModel viewGalModel = ViewGalleryResponseModel();
    try {
      var response = await ApiBase.getRequest(
        extendedURL:
            "${ApiUrl.viewSchoolGallery}?schoolName=${SharedService.loginDetails()?.data!.data!.school}",
      );
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          viewGalModel = viewGalleryResponseModelFromJson(response.body);
        } else {
          viewGalModel = ViewGalleryResponseModel();
        }
      } else {
        viewGalModel = ViewGalleryResponseModel();
      }
    } catch (e) {
      viewGalModel = ViewGalleryResponseModel();
    }

    return viewGalModel;
  }
  //..... View events Parents ......................................................

  static Future<StudentsViewEventsResponseModel> parentViewSchoolEvents(
    String status,
  ) async {
    StudentsViewEventsResponseModel viewEvents =
        StudentsViewEventsResponseModel();
    try {
      fetchChildData();
      var response = await ApiBase.getRequest(
        extendedURL:
            "${ApiUrl.viewSchoolEvents}?schoolName=${SharedService.childDetails()?.data!.school}&status=$status",
      );
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          viewEvents = studentsViewEventsResponseModelFromJson(response.body);
        } else {
          viewEvents = StudentsViewEventsResponseModel();
        }
      } else {
        viewEvents = StudentsViewEventsResponseModel();
      }
    } catch (e) {
      viewEvents = StudentsViewEventsResponseModel();
    }

    return viewEvents;
  }

  //..... View events Students ......................................................

  static Future<StudentsViewEventsResponseModel> viewSchoolEvents(
    String status,
  ) async {
    StudentsViewEventsResponseModel viewEvents =
        StudentsViewEventsResponseModel();
    try {
      var response = await ApiBase.getRequest(
        extendedURL:
            "${ApiUrl.viewSchoolEvents}?schoolName=${SharedService.loginDetails()?.data!.data!.school}&status=$status",
      );
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          viewEvents = studentsViewEventsResponseModelFromJson(response.body);
        } else {
          viewEvents = StudentsViewEventsResponseModel();
        }
      } else {
        viewEvents = StudentsViewEventsResponseModel();
      }
    } catch (e) {
      viewEvents = StudentsViewEventsResponseModel();
    }

    return viewEvents;
  }

  //........ Teacher Upload Events.....................................................

  static Future<bool> teacherUploadEvents(
    String eventName,
    String description,
    String date,
    String eventTime,
    String status,
    String eligibleClass,
    String remark,
    List<XFile> files,
  ) async {
    var ret = false;

    try {
      String? schoolName = SharedService.loginDetails()?.data!.data!.school;
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
          "http://${ApiUrl.baseUrl}${ApiUrl.teacherUploadEvents}",
        ),
      );

      // Add headers
      Map<String, String> headers = {
        'Authorization':
            "Bearer ${SharedService.loginDetails()?.data!.token}", // Assuming 'Bearer' is required for the token
      };
      request.headers.addAll(headers);

      // Add form fields
      request.fields['schoolName'] = schoolName!;
      request.fields['eventName'] = eventName;
      request.fields['description'] = description;
      request.fields['date'] = date;
      request.fields['eventTime'] = eventTime;
      request.fields['status'] = status;
      request.fields['remark'] = remark;
      request.fields['eligibleClass'] = eligibleClass;

      // Add files
      for (var file in files) {
        var fileStream = http.ByteStream(file.openRead());
        var length = await file.length();
        var multipartFile = http.MultipartFile(
          'files[]', // Use 'files[]' to indicate it's an array of files
          fileStream.cast(),
          length,
          filename: p.basename(file.path),
        );
        request.files.add(multipartFile);
      }

      var response = await request.send();
      log("http://${ApiUrl.baseUrl}${ApiUrl.teacherUploadEvents}");
      log(response.statusCode.toString());
      log("");
      log(schoolName);
      log(eventName);
      log(description);
      log(date);
      log(eventTime);
      log(status);
      log(remark);
      log(eligibleClass);
      log(files.length.toString());

      if (response.statusCode == 200) {
        var jsonResponse = await response.stream.bytesToString();
        var teacherUploadGal = teacherUploadEventsModelFromJson(jsonResponse);

        if (teacherUploadGal.status == true) {
          ret = true;
        } else {
          log("API returned a failure status.");
        }
      } else {
        var jsonResponse = await response.stream.bytesToString();
        var teacherUploadGal = teacherUploadEventsModelFromJson(jsonResponse);
        log("Error mesaage = ${teacherUploadGal.message.toString()}");
        log("API request failed with status code: ${response.statusCode}");
      }
    } catch (e) {
      log("API request failed with an exception: $e");
    }

    return ret;
  }












// Students View Awards/certificates.....................................................

  static Future<StudentViewAwardsResponseModel> parentsViewChildCertificates() async {
    StudentViewAwardsResponseModel myCertificates =
        StudentViewAwardsResponseModel();
    try {
      fetchChildData();
      var response = await ApiBase.getRequest(
        extendedURL:
            "${ApiUrl.studentViewAwards}/${SharedService.childDetails()?.data!.id}",
      );
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          myCertificates =
              studentViewAwardsResponseModelFromJson(response.body);
        } else {
          myCertificates = StudentViewAwardsResponseModel();
        }
      } else {
        myCertificates = StudentViewAwardsResponseModel();
      }
    } catch (e) {
      myCertificates = StudentViewAwardsResponseModel();
    }

    return myCertificates;
  }














// Students View Awards/certificates.....................................................

  static Future<StudentViewAwardsResponseModel> viewMyCertificates() async {
    StudentViewAwardsResponseModel myCertificates =
        StudentViewAwardsResponseModel();
    try {
      var response = await ApiBase.getRequest(
        extendedURL:
            "${ApiUrl.studentViewAwards}/${SharedService.loginDetails()?.data!.id}",
      );
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          myCertificates =
              studentViewAwardsResponseModelFromJson(response.body);
        } else {
          myCertificates = StudentViewAwardsResponseModel();
        }
      } else {
        myCertificates = StudentViewAwardsResponseModel();
      }
    } catch (e) {
      myCertificates = StudentViewAwardsResponseModel();
    }

    return myCertificates;
  }

  // Teacher Upload Awards.........................................

  static Future<bool> teacherUploadAwards(
    String studentName,
    String wclass,
    String section,
    String rollNumber,
    String certificationHeading,
    String date,
    File file,
    BuildContext context,
  ) async {
    var ret = false;

    try {
      var schoolName = SharedService.loginDetails()?.data!.data!.school;
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
          "http://${ApiUrl.baseUrl}${ApiUrl.teacherUploadAwards}",
        ),
      );

      // Add headers here
      Map<String, String> headers = {
        'Authorization':
            "${SharedService.loginDetails()?.data!.token}", // Replace with your token
      };
      request.headers.addAll(headers);

      request.fields['certificationDate'] = date;
      request.fields['class'] = wclass;
      request.fields['section'] = section;
      request.fields['studentName'] = studentName;
      request.fields['rollNumber'] = rollNumber;
      request.fields['certificationHeading'] = certificationHeading;
      request.fields['schoolName'] = schoolName!;

      log("http://${ApiUrl.baseUrl}${ApiUrl.teacherUploadAwards}");
      log("date= $date");
      log("class=$wclass");
      log("section=$section");
      log("Name=$studentName");
      log("rollNumber=$rollNumber");
      log("SchoolName=$schoolName");

      var fileStream = http.ByteStream(file.openRead());
      var length = await file.length();
      var multipartFile = http.MultipartFile(
        'file',
        fileStream.cast(),
        length,
        filename: p.basename(file.path),
      );
      request.files.add(multipartFile);

      var response = await http.Response.fromStream(await request.send());

      log(response.statusCode.toString());
      log(response.body);

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        if (jsonResponse['status'] == true) {
          // var studentUploadAssign =
          //     studentUploadAssignmentModelFromJson(response.body);
          ret = true;
        } else {
          log(response.statusCode.toString());
          ret = false;
          log("not successful else");
        }
      } else {
        log(response.statusCode.toString());
        ret = false;
        log("not successful else 2");
      }
    } catch (e) {
      ret = false;
      log("$e : not successful catch");
    }

    return ret;
  }

// Update my account details Student..................................................

  static Future<bool> updateMyAccountStudent(
    String name,
    String email,
    String phone,
    String password,
    String city,
  ) async {
    var ret = false;

    try {
      var response = await ApiBase.putRequest(
        extendedURL:
            "${ApiUrl.updateMytAccountStudent}/${SharedService.loginDetails()?.data!.id}",
        body: {
          "name": name,
          "email": email,
          "phoneNumber": phone,
          "password": password,
          "address": city,
        },
      );

      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          ret = true;
        } else {
          ret = false;
          log("Not Successful");
        }
      } else {
        ret = false;
        log("Not Successful");
      }
    } catch (e) {
      log("error: $e");
    }
    return ret;
  }

//.... Update my account details Teacher....................................
  static Future<bool> updateMyAccountTeacher(
    String name,
    String email,
    String phone,
    String password,
    String city,
  ) async {
    var ret = false;

    try {
      var response = await ApiBase.putRequest(
        extendedURL:
            "${ApiUrl.updateMytAccountTeacher}/${SharedService.loginDetails()?.data!.id}",
        body: {
          "name": name,
          "email": email,
          "phoneNumber": phone,
          "password": password,
          "address": city,
        },
      );

      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          ret = true;
        } else {
          ret = false;
          log("Not Successful");
        }
      } else {
        ret = false;
        log("Not Successful");
      }
    } catch (e) {
      log("error: $e");
    }
    return ret;
  }

// Student enroll for event ( Eligibility verify)............................

  static Future<StudentEnrollEventEligibilityResponseModel>
      studentEligibilityCheckForEnrollEvents(
    String eventID,
  ) async {
    StudentEnrollEventEligibilityResponseModel eligibleCheck =
        StudentEnrollEventEligibilityResponseModel();

    try {
      var stId = SharedService.loginDetails()?.data!.id;
      var response = await ApiBase.getRequest(
        extendedURL:
            "${ApiUrl.studentEligibilityCheckForEnrollEvents}?eventId=$eventID&studentId=${SharedService.loginDetails()?.data!.id}",
      );
      log(response.statusCode.toString());
      log("Event ID= ${eventID}");
      log("Student ID= ${stId.toString()}");
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          eligibleCheck =
              studentEnrollEventEligibilityResponseModelFromJson(response.body);
        } else {
          eligibleCheck = StudentEnrollEventEligibilityResponseModel();
        }
      } else {
        eligibleCheck = StudentEnrollEventEligibilityResponseModel();
      }
    } catch (e) {
      eligibleCheck = StudentEnrollEventEligibilityResponseModel();
    }

    return eligibleCheck;
  }

  //...Student Register for events POST api...................................
  static Future<bool> studentRegisterEvent(
    String name,
    String wclass,
    String section,
    String rollNumber,
    String email,
    String phone,
    String eventName,
    String gender,
    String eventID,
  ) async {
    var ret = false;

    try {
      var studentID = SharedService.loginDetails()?.data!.id;
      var response = await ApiBase.postRequest(
        extendedURL: ApiUrl.studentRegisterEventPost,
        body: {
          "studentName": name,
          "class": wclass,
          "section": section,
          "rollNumber": rollNumber,
          "email": email,
          "phoneNumber": phone,
          "eventName": eventName,
          "gender": gender,
          "studentId": studentID,
          "eventId": eventID,
        },
      );
      log(name);
      log(wclass);
      log(section);
      log(rollNumber);
      log(email);
      log(phone);
      log(eventID);
      log(studentID.toString());

      log(response.body.toString());
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          ret = true;
        } else {
          ret = false;
          log("Not Successful");
        }
      } else {
        ret = false;
        log("Not Successful");
      }
    } catch (e) {
      log("error: $e");
    }
    return ret;
  }

  //.... View awards class wise Students List ( Teacher view)...................

  static Future<ClassWiseAwardsListOfStudentsResponseModel>
      classWiseAwardsListOfStudents(
          String selectedClass, String selectedSection) async {
    ClassWiseAwardsListOfStudentsResponseModel classWiseStudentsAwards =
        ClassWiseAwardsListOfStudentsResponseModel();
    try {
      var response = await ApiBase.getRequest(
        extendedURL:
            "${ApiUrl.classWiseAwardsListOfStudents}?schoolName=${SharedService.loginDetails()?.data!.data!.school}&class=${selectedClass}&section=${selectedSection}",
      );
      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          classWiseStudentsAwards =
              classWiseAwardsListOfStudentsResponseModelFromJson(response.body);
        } else {
          classWiseStudentsAwards =
              ClassWiseAwardsListOfStudentsResponseModel();
        }
      } else {
        classWiseStudentsAwards = ClassWiseAwardsListOfStudentsResponseModel();
      }
    } catch (e) {
      classWiseStudentsAwards = ClassWiseAwardsListOfStudentsResponseModel();
    }

    return classWiseStudentsAwards;
  }

  // Notice Student View Get.................................................

  static Future<ViewNoticeResponseModel> viewNotice() async {
    ViewNoticeResponseModel viewNotice = ViewNoticeResponseModel();
    try {
      var response = await ApiBase.getRequest(
        extendedURL:
            "${ApiUrl.viewNotice}/${SharedService.loginDetails()?.data!.id}?schoolName=${SharedService.loginDetails()?.data!.data!.school}",
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          viewNotice = viewNoticeResponseModelFromJson(response.body);
        } else {
          viewNotice = ViewNoticeResponseModel();
        }
      } else {
        viewNotice = ViewNoticeResponseModel();
      }
    } catch (e) {
      viewNotice = ViewNoticeResponseModel();
    }

    return viewNotice;
  }

  // Verify read Unread notices...............................................

  static Future<bool> verifyReadUnreadNotice(String noticeID) async {
    var ret = false;
    try {
      var response = await ApiBase.putRequest(
        extendedURL: ApiUrl.verifyReadUnreadNotice,
        body: {
          "schoolName": SharedService.loginDetails()!.data!.data!.school,
          "read": "true",
          "studentId": SharedService.loginDetails()!.data!.id,
          "noticeId": noticeID,
        },
      );
      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          ret = true;
        } else {
          ret = false;
          log("Not Successful");
        }
      } else {
        ret = false;
        log("Not Successful");
      }
    } catch (e) {
      log("error: $e");
    }
    return ret;
  }
// Teacher see registered students of partticular events.......................

  static Future<EventRegisteredStudentListResponseModel>
      getRegisteredStudentListEvents(String eventID) async {
    EventRegisteredStudentListResponseModel viewStudentList =
        EventRegisteredStudentListResponseModel();
    try {
      var response = await ApiBase.getRequest(
        extendedURL:
            "${ApiUrl.getRegisteredStudentListEvents}?eventId=$eventID",
      );
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          viewStudentList =
              eventRegisteredStudentListResponseModelFromJson(response.body);
        } else {
          viewStudentList = EventRegisteredStudentListResponseModel();
        }
      } else {
        viewStudentList = EventRegisteredStudentListResponseModel();
      }
    } catch (e) {
      viewStudentList = EventRegisteredStudentListResponseModel();
    }

    return viewStudentList;
  }

//.........Students see my enrolled events GET api.........................

  static Future<StudentMyEnrolledEventsResponseModel>
      studentSeeMyEnrolledEvents() async {
    StudentMyEnrolledEventsResponseModel myEnrolledEventsList =
        StudentMyEnrolledEventsResponseModel();
    try {
      var studentID = SharedService.loginDetails()?.data!.id;
      var response = await ApiBase.getRequest(
        extendedURL:
            "${ApiUrl.studentSeeMyEnrolledEvents}?studentId=$studentID",
      );
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          myEnrolledEventsList =
              studentMyEnrolledEventsResponseModelFromJson(response.body);
        } else {
          myEnrolledEventsList = StudentMyEnrolledEventsResponseModel();
        }
      } else {
        myEnrolledEventsList = StudentMyEnrolledEventsResponseModel();
      }
    } catch (e) {
      myEnrolledEventsList = StudentMyEnrolledEventsResponseModel();
    }

    return myEnrolledEventsList;
  }

// Teacher Upload Notice........................................................

  static Future<bool> teacherUploadNotice(
    String noticeNeading,
    String noticeDescription,
    String noticeDate,
    File file,
    BuildContext context,
  ) async {
    var ret = false;

    try {
      var schoolName = SharedService.loginDetails()?.data!.data!.school;
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
          "http://${ApiUrl.baseUrl}${ApiUrl.teacherUploadNotice}",
        ),
      );

      // Add headers here
      Map<String, String> headers = {
        'Authorization': "${SharedService.loginDetails()?.data!.token}",
      };
      request.headers.addAll(headers);

      request.fields['heading'] = noticeNeading;
      request.fields['description'] = noticeDescription;
      request.fields['date'] = noticeDate;
      request.fields['schoolName'] = schoolName!;

      log("http://${ApiUrl.baseUrl}${ApiUrl.teacherUploadAwards}");

      log("SchoolName=$schoolName");

      var fileStream = http.ByteStream(file.openRead());
      var length = await file.length();
      var multipartFile = http.MultipartFile(
        'file',
        fileStream.cast(),
        length,
        filename: p.basename(file.path),
      );
      request.files.add(multipartFile);

      var response = await http.Response.fromStream(await request.send());

      log(response.statusCode.toString());
      log(response.body);

      if (response.statusCode == 201) {
        var jsonResponse = json.decode(response.body);
        if (jsonResponse['status'] == true) {
          ret = true;
        } else {
          log(response.statusCode.toString());
          ret = false;
          log("not successful else");
        }
      } else {
        log(response.statusCode.toString());
        ret = false;
        log("not successful else 2");
      }
    } catch (e) {
      ret = false;
      log("$e : not successful catch");
    }

    return ret;
  }


    // Student see own result GET api.................................................

  static Future<StudentResultResponseModel> parentSeeResult(
      String testType) async {
    StudentResultResponseModel result = StudentResultResponseModel();
    try {
      fetchChildData();
      var response = await ApiBase.getRequest(
        extendedURL:
            "${ApiUrl.studentSeeResult}/${SharedService.childDetails()?.data?.id}?examType=$testType&schoolName=${SharedService.childDetails()?.data?.school}",
      );
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          result = studentResultResponseModelFromJson(response.body);
        } else {
          result = StudentResultResponseModel();
        }
      } else {
        result = StudentResultResponseModel();
      }
    } catch (e) {
      result = StudentResultResponseModel();
    }

    return result;
  }

  // Student see own result GET api.................................................

  static Future<StudentResultResponseModel> studentSeeResult(
      String testType) async {
    StudentResultResponseModel result = StudentResultResponseModel();
    try {
      var response = await ApiBase.getRequest(
        extendedURL:
            "${ApiUrl.studentSeeResult}/${SharedService.loginDetails()!.data!.id}?examType=$testType&schoolName=${SharedService.loginDetails()!.data!.data!.school}",
      );
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          result = studentResultResponseModelFromJson(response.body);
        } else {
          result = StudentResultResponseModel();
        }
      } else {
        result = StudentResultResponseModel();
      }
    } catch (e) {
      result = StudentResultResponseModel();
    }

    return result;
  }
//......................Teacher Post Result...................................

  static Future<bool> uploadResultSpecificStudent(
      Map<String, dynamic> resultData) async {
    var ret = false;
    try {
      var response = await ApiBase.postRequest(
        extendedURL: ApiUrl.uploadResult,
        body: resultData,
      );

      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          ret = true;
        } else {
          ret = false;
          log("not successful");
        }
      } else {
        ret = false;
        log("not successful ");
      }
    } catch (e) {
      ret = false;
      log("$e :  not successful catch");
    }

    return ret;
  }

//............... Teacher View Results..........................................
  static Future<ClassWiseResultResponseModel> teacherViewReqsultClassWise(
      String selectedClass, String testType) async {
    ClassWiseResultResponseModel wholeClassResult =
        ClassWiseResultResponseModel();
    try {
      var school = SharedService.loginDetails()!.data!.data!.school;
      var response = await ApiBase.getRequest(
        extendedURL:
            "${ApiUrl.teacherViewReqsultClassWise}?schoolName=$school&class=$selectedClass&examType=$testType",
      );
      log(response.statusCode.toString());
      log(response.body.toString());

      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          wholeClassResult =
              classWiseResultResponseModelFromJson(response.body);
        } else {
          wholeClassResult = ClassWiseResultResponseModel();
        }
      } else {
        wholeClassResult = ClassWiseResultResponseModel();
      }
    } catch (e) {
      wholeClassResult = ClassWiseResultResponseModel();
    }

    return wholeClassResult;
  }

// Delete result by teacher...................................................

  static Future<void> deleteResult(String resultId) async {
    final response = await http.delete(
      Uri.parse("http://13.232.53.26:3000/deleteResultOfStudent/$resultId"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        // Add any additional headers as needed
      },
    );

    if (response.statusCode == 200) {
      log('Deleted successfully');
    } else {
      log('Failed to delete data. Status code: ${response.statusCode}');
      log('Response body: ${response.body}');
      // Handle the error as needed
    }
  }

  // view Exam Routine parent ..................................................
  static Future<ExamRoutineResponseModel> parentViewExamRoutine(
      String testType) async {
    ExamRoutineResponseModel examRoutine = ExamRoutineResponseModel();
    try {
      fetchChildData();
      var selectedClass =
          SharedService.childDetails()!.data?.dataClass.toString();
      var school = SharedService.childDetails()!.data!.school;
      var response = await ApiBase.getRequest(
        extendedURL:
            "${ApiUrl.viewExamRoutine}?schoolName=$school&class=$selectedClass&examType=$testType",
      );
      log(response.statusCode.toString());
      log(response.body.toString());

      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          examRoutine = examRoutineResponseModelFromJson(response.body);
        } else {
          examRoutine = ExamRoutineResponseModel();
        }
      } else {
        examRoutine = ExamRoutineResponseModel();
      }
    } catch (e) {
      examRoutine = ExamRoutineResponseModel();
    }

    return examRoutine;
  }
// View Exam routine (GET API)..................................................

  static Future<ExamRoutineResponseModel> viewExamRoutine(
      String selectedClass, String testType) async {
    ExamRoutineResponseModel examRoutine = ExamRoutineResponseModel();
    try {
      var school = SharedService.loginDetails()!.data!.data!.school;
      var response = await ApiBase.getRequest(
        extendedURL:
            "${ApiUrl.viewExamRoutine}?schoolName=$school&class=$selectedClass&examType=$testType",
      );
      log(response.statusCode.toString());
      log(response.body.toString());

      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          examRoutine = examRoutineResponseModelFromJson(response.body);
        } else {
          examRoutine = ExamRoutineResponseModel();
        }
      } else {
        examRoutine = ExamRoutineResponseModel();
      }
    } catch (e) {
      examRoutine = ExamRoutineResponseModel();
    }

    return examRoutine;
  }

// Teacher Upload exam routine (POST API)................................................

  static Future<bool> uploadExamRoutine(Map<String, dynamic> examData) async {
    var ret = false;
    try {
      var response = await ApiBase.postRequest(
        extendedURL: ApiUrl.uploadExamRoutine,
        body: examData,
      );

      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          ret = true;
        } else {
          ret = false;
          log("not successful");
        }
      } else {
        ret = false;
        log("not successful ");
      }
    } catch (e) {
      ret = false;
      log("$e :  not successful catch");
    }

    return ret;
  }
//.... Teacher Delete Exam Routine..............................................

  static Future<void> deleteExamRoutine(String examId) async {
    final response = await http.delete(
      Uri.parse("http://13.232.53.26:3000/deleteExam/$examId"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        // Add any additional headers as needed
      },
    );

    if (response.statusCode == 200) {
      log('Deleted successfully');
    } else {
      log('Failed to delete data. Status code: ${response.statusCode}');
      log('Response body: ${response.body}');
      // Handle the error as needed
    }
  }

  // View About School.........................................................

  static Future<AboutSchoolResponseModel> ViewAboutSchool() async {
    AboutSchoolResponseModel about = AboutSchoolResponseModel();
    try {
      var school = SharedService.loginDetails()!.data!.data!.school;
      var response = await ApiBase.getRequest(
        extendedURL: "${ApiUrl.viewAboutSchool}?schoolName=$school",
      );
      log(response.statusCode.toString());
      log(response.body.toString());

      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          about = aboutSchoolResponseModelFromJson(response.body);
        } else {
          about = AboutSchoolResponseModel();
        }
      } else {
        about = AboutSchoolResponseModel();
      }
    } catch (e) {
      about = AboutSchoolResponseModel();
    }

    return about;
  }

  //................... Teacher upload Aout school..........................................

  static Future<bool> teacherUploadAboutUs(
    String schoolAddress,
    String websiteLink,
    String schoolEmailId,
    String aboutSchool,
    String coreValues,
    String principalOffice,
    String admissionDepartment,
    String enquiryDepartment,
    File rulesAndRegulation,
    File profilePic,
    File coverPic,
    BuildContext context,
  ) async {
    var ret = false;

    try {
      var schoolName = SharedService.loginDetails()?.data!.data!.school;
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
          "http://13.232.53.26:3000/createAbout-us",
        ),
      );

      // Add headers here
      Map<String, String> headers = {
        'Authorization': "${SharedService.loginDetails()?.data!.token}",
      };
      request.headers.addAll(headers);

      request.fields['schoolName'] = schoolName!;
      request.fields['schoolAddress'] = schoolAddress;
      request.fields['websiteLink'] = websiteLink;
      request.fields['schoolEmailId'] = schoolEmailId;
      request.fields['aboutSchool'] = aboutSchool;
      request.fields['coreValues'] = coreValues;
      request.fields['principalOffice'] = principalOffice;
      request.fields['admissionDepartment'] = admissionDepartment;
      request.fields['enquiryDepartment'] = enquiryDepartment;

      log("http://${ApiUrl.baseUrl}${ApiUrl.teacherUploadAwards}");

      log("SchoolName=$schoolName");

      // Add rulesAndRegulation file
      var rulesAndRegulationStream =
          http.ByteStream(rulesAndRegulation.openRead());
      var rulesAndRegulationLength = await rulesAndRegulation.length();
      var rulesAndRegulationMultipartFile = http.MultipartFile(
        'rulesAndRegulation',
        rulesAndRegulationStream.cast(),
        rulesAndRegulationLength,
        filename: p.basename(rulesAndRegulation.path),
      );
      request.files.add(rulesAndRegulationMultipartFile);

      // Add profilePic file
      var profilePicStream = http.ByteStream(profilePic.openRead());
      var profilePicLength = await profilePic.length();
      var profilePicMultipartFile = http.MultipartFile(
        'profilePic',
        profilePicStream.cast(),
        profilePicLength,
        filename: p.basename(profilePic.path),
      );
      request.files.add(profilePicMultipartFile);

      // Add coverPic file
      var coverPicStream = http.ByteStream(coverPic.openRead());
      var coverPicLength = await coverPic.length();
      var coverPicMultipartFile = http.MultipartFile(
        'coverPic',
        coverPicStream.cast(),
        coverPicLength,
        filename: p.basename(coverPic.path),
      );
      request.files.add(coverPicMultipartFile);

      var response = await http.Response.fromStream(await request.send());

      log(response.statusCode.toString());
      log(response.body);

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        if (jsonResponse['status'] == true) {
          ret = true;
        } else {
          log(response.statusCode.toString());
          ret = false;
          log("not successful else");
        }
      } else {
        log(response.statusCode.toString());
        ret = false;
        log("not successful else 2");
      }
    } catch (e) {
      ret = false;
      log("$e : not successful catch");
    }

    return ret;
  }
}

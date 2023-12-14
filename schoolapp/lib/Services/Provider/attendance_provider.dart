import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../Models/Teacher/Attendance/Original_Model/attendance_response_model.dart';
import '../api_services.dart';

class AttendanceProvider extends ChangeNotifier {
  bool loading = false;
  AttendanceResponseModel? attendanceResponseModel;
  takeStudentsAttendance({
    required String classNo,
    required String sectionNo,
  }) async {
    loading = true;
    attendanceResponseModel =
        await ApiServices.takeAttendance(classNo, sectionNo);
    for (var i = 0; i < attendanceResponseModel!.data!.length; i++) {
      attendanceResponseModel!.data![i].attendance = "absent";
    }
    loading = false;
    notifyListeners();
  }

  resetData() {
    attendanceResponseModel = null;
    notifyListeners();
  }

  updateAttendanceList({required String attendanceStatus, required int index}) {
    attendanceResponseModel!.data![index].attendance = attendanceStatus;
    log(index.toString());
    notifyListeners();
  }

  setAttendanceDate() {
    attendanceResponseModel!.attendanceDate =
        DateFormat('yyyy-MM-dd').format(DateTime.now());
    notifyListeners();
  }
}

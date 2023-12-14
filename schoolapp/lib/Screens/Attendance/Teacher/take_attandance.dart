import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management_system/Services/Provider/attendance_provider.dart';
import 'package:school_management_system/Services/api_services.dart';
import 'package:school_management_system/widget/Button/rectangle_elevatedbutton_card.dart';
import 'package:school_management_system/widget/appBar/decorative_apbar_widget.dart';
import 'package:school_management_system/widget/teacher/Attendance/take_attendance_card.dart';
import '../../../../constants/style.dart';
import '../../../widget/appBar/appbar_widget.dart';

class TeacherAttendance extends StatefulWidget {
  final String selectedClass;
  final String selectedSection;

  const TeacherAttendance(
      {super.key, required this.selectedClass, required this.selectedSection});

  @override
  State<TeacherAttendance> createState() => _TeacherAttendanceState();
}

class _TeacherAttendanceState extends State<TeacherAttendance> {
  late AttendanceProvider attendanceProvider;

  void showSuccessSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Attendance Submitted Successfully'),
        duration: Duration(seconds: 3), // Adjust the duration as needed
      ),
    );
  }

  void showFalureSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.red,
        content: Text('Attendance Already Submitted'),
        duration: Duration(seconds: 3), // Adjust the duration as needed
      ),
    );
  }

  @override
  void initState() {
    attendanceProvider =
        Provider.of<AttendanceProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      attendanceProvider.resetData();
      attendanceProvider.takeStudentsAttendance(
          classNo: widget.selectedClass, sectionNo: widget.selectedSection);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          MediaQuery.of(context).size.height * 0.3,
        ),
        child: DecorativeAppBar(
          barHeight: MediaQuery.of(context).size.height * 0.24,
          barPad: MediaQuery.of(context).size.height * 0.19,
          radii: 30,
          background: Colors.white,
          gradient1: lightBlue,
          gradient2: deepBlue,
          extra: appbar("assets/attendance_appbar.png", " Attendance", context,
              () {
            Navigator.pop(context);
          }),
        ),
      ),
      body: Consumer<AttendanceProvider>(builder: (context, providerr, child) {
        return providerr.loading || providerr.attendanceResponseModel == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: providerr.attendanceResponseModel!.data!.length,
                itemBuilder: (context, index) {
                  return TakeAttendanceCard(index: index);
                },
              );
      }),
      persistentFooterButtons: [
        Consumer<AttendanceProvider>(builder: (context, providerr, child) {
          return RecElevatedButton(
            onPressed: () {
              providerr.setAttendanceDate();
              // log(attendanceResponseModelToJson(
              //     providerr.attendanceResponseModel!));

              ApiServices.submitAttendance(
                      providerr.attendanceResponseModel!.toJson())
                  .then((value) {
                if (value == true) {
                  showSuccessSnackbar();
                  Navigator.pop(context);
                } else {
                  showFalureSnackbar();
                }
              });
            },
            child: const Text(
              "Submit",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          );
        }),
      ],
    );
  }
}

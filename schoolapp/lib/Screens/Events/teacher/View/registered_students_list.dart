import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:school_management_system/Services/api_services.dart';
import '../../../../Models/Teacher/Events/event_registered_student_list_model.dart';
import '../../../../constants/style.dart';
import '../../../../widget/appBar/appbar_widget.dart';
import '../../../../widget/appBar/decorative_apbar_widget.dart';
import '../../../../widget/teacher/Events/enrolled_student_events_card.dart';

class TeacherSeeEventEnrolledStudents extends StatelessWidget {
  final String eventID;
  const TeacherSeeEventEnrolledStudents({super.key, required this.eventID});

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
          extra:
              appbar("assets/add_events.png", "Enrolled Students", context, () {
            Navigator.pop(context);
          }),
        ),
      ),
      body: FutureBuilder<EventRegisteredStudentListResponseModel>(
        future: ApiServices.getRegisteredStudentListEvents(eventID),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Text('Error: ...');
          } else if (!snapshot.hasData ||
              snapshot.data!.data!.studentList!.length == 0) {
            return const Center(child: Text('No events found.'));
          } else {
            EventRegisteredStudentListResponseModel? studentList =
                snapshot.data;
            return ListView.builder(
                itemCount: studentList!.data!.studentList!.length,
                itemBuilder: (context, index) {
                  return EventEnrollStudentsCard(
                    studentName: studentList
                        .data!.studentList![index].studentName
                        .toString(),
                    studentSection: studentList
                        .data!.studentList![index].section
                        .toString(),
                    studentRoll: studentList
                        .data!.studentList![index].rollNumber
                        .toString(),
                    studentClass: studentList
                        .data!.studentList![index].studentListClass
                        .toString(),
                    studentPhone:
                        studentList.data!.studentList![index].email.toString(),
                    studentEmail: studentList
                        .data!.studentList![index].phoneNumber
                        .toString(),
                  );
                });
          }
        },
      ),
    );
  }
}

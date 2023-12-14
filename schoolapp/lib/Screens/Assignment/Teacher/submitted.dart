import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import the intl package
import 'package:school_management_system/Services/api_services.dart';
import 'package:school_management_system/constants/style.dart';
import 'package:school_management_system/widget/appBar/appbar_widget.dart';
import 'package:school_management_system/widget/appBar/decorative_apbar_widget.dart';

import '../../../Models/Teacher/assignment_submitted_students_model.dart';
import '../../../widget/teacher/Assignments/submitted_students_list_card.dart';

class TeacherSeeAllSubmittedStudentsAssignment extends StatelessWidget {
  String wclass;
  String section;
  String assID;
  TeacherSeeAllSubmittedStudentsAssignment({
    super.key,
    required this.assID,
    required this.wclass,
    required this.section,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(300),
        child: DecorativeAppBar(
          barHeight: MediaQuery.of(context).size.height * 0.24,
          barPad: MediaQuery.of(context).size.height * 0.19,
          radii: 30,
          background: Colors.white,
          gradient1: lightBlue,
          gradient2: deepBlue,
          extra: appbar(
              "assets/flaticon/_assignments.png", "Assignments", context, () {
            Navigator.pop(context);
          }),
        ),
      ),
      body: FutureBuilder<TeacherSeeSubmittedStudentsAssignments>(
        future: ApiServices.TeacherSeeSubittedStudents(assID, wclass, section),
        builder: (context, snapshot) {
          TeacherSeeSubmittedStudentsAssignments? submittedStudents =
              snapshot.data;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.data!.data!.submittedStudentId!.isEmpty) {
            return const Center(child: Text("Nobody has submitted"));
          } else {
            return ListView.builder(
              itemCount: submittedStudents!.data!.submittedStudentId!.length,
              itemBuilder: (context, index) {
                // Format the date
                String formattedDate = DateFormat('dd-MM-yy').format(
                  DateTime.parse(
                    submittedStudents.data!.submittedStudentId![index].date
                        .toString(),
                  ),
                );
                return TeacherSubmittedAssignmentCard(
                  file: submittedStudents.data!.submittedStudentId![index].link
                      .toString(),
                  roll: submittedStudents
                      .data!.submittedStudentId![index].rollNumber
                      .toString(),
                  name: submittedStudents.data!.submittedStudentId![index].name
                      .toString(),
                  fileLink: submittedStudents
                      .data!.submittedStudentId![index].link
                      .toString(),
                  SubmitDate: formattedDate, // Use the formatted date
                );
              },
            );
          }
        },
      ),
    );
  }
}

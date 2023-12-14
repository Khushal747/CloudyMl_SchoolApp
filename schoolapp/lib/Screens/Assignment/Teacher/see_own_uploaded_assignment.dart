import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:school_management_system/Services/api_services.dart';
import 'package:school_management_system/constants/style.dart';
import 'package:school_management_system/widget/appBar/appbar_widget.dart';
import 'package:school_management_system/widget/appBar/decorative_apbar_widget.dart';
import 'package:school_management_system/widget/teacher/Assignments/teacher_see_own_uploaded_assignment_card.dart';
import '../../../Models/Teacher/given_assignmens_list_model.dart';

class TeacherSeeOwnUploadedAssignment extends StatelessWidget {
  final String wclass;
  final String section;
  const TeacherSeeOwnUploadedAssignment(
      {super.key, required this.wclass, required this.section});

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
      body: FutureBuilder<TeacherSeeOwnAssignmentsListModel>(
        future: ApiServices.teacherSeeOwnGivenAssignment(wclass, section),
        builder: (context, snapshot) {
          TeacherSeeOwnAssignmentsListModel? teacherSeeAllAssignment =
              snapshot.data;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Error.."));
          } else if (snapshot.data!.data!.length == 0) {
            return const Center(child: Text("No data found"));
          } else {
            return ListView.builder(
              itemCount: teacherSeeAllAssignment!.data!.length,
              itemBuilder: (BuildContext context, int index) {
                // Format the givenDate and submitDate
                String formattedGivenDate = DateFormat('dd-MM-yyyy').format(
                  DateTime.parse(
                    teacherSeeAllAssignment.data![index].date.toString(),
                  ),
                );
                String formattedSubmitDate = DateFormat('dd-MM-yyyy').format(
                  DateTime.parse(
                    teacherSeeAllAssignment.data![index].lastDateOfSubmit
                        .toString(),
                  ),
                );

                return TeacherSeeOwnUploadedAssignmentCard(
                  assignmentID:
                      teacherSeeAllAssignment.data![index].id.toString(),
                  givenDate: formattedGivenDate,
                  subject:
                      teacherSeeAllAssignment.data![index].subject.toString(),
                  submitDate: formattedSubmitDate, // Use the formatted date
                  topic: teacherSeeAllAssignment.data![index].topic.toString(),
                  section: section,
                  wclass: wclass,
                );
              },
            );
          }
        },
      ),
    );
  }
}

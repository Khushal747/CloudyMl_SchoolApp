
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:school_management_system/Services/api_services.dart';
import 'package:school_management_system/constants/style.dart';
import 'package:school_management_system/widget/appBar/decorative_apbar_widget.dart';

import '../../../Models/Student/submitted_assignment_model.dart';
import '../../../widget/appBar/appbar_widget.dart';
import '../../../widget/student/Assignments/student_submitted_assignment_card.dart';

class SubmittedAssignment extends StatelessWidget {
  const SubmittedAssignment({super.key});

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
          extra: appbar(
              "assets/flaticon/_assignments.png", " Submitted", context, () {
            Navigator.pop(context);
          }),
        ),
      ),
      body: FutureBuilder<StudentSubmittedAssignmentModel>(
        future: ApiServices.StudentSubmittedAssignment(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text("Error : ${snapshot.error}");
          } else if (!snapshot.hasData || snapshot.data!.data!.isEmpty) {
            return const Center(
              child: Text("No assignment available"),
            ); // Handle the case where there is no data
          } else {
            StudentSubmittedAssignmentModel? submitted = snapshot.data;

            return ListView.builder(
              itemCount: submitted!.data!.length,
              itemBuilder: (context, index) {
                String formattedSubmitDate = DateFormat('dd-MM-yyyy').format(
                  DateTime.parse(
                    submitted.data![index].date.toString(),
                  ),
                );

                return StudentSubmittedAssignmentCard(
                  subject: submitted.data![index].subject.toString(),
                  Submitdate: formattedSubmitDate,
                  file: submitted.data![index].link.toString(),
                );
              },
            );
          }
        },
      ),
    );
  }
}

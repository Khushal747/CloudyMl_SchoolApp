import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:school_management_system/Models/Student/Exam/exam_routine_response_model.dart';
import 'package:school_management_system/Services/api_services.dart';
import 'package:school_management_system/widget/Button/my_elevatedbutton.dart';
import '../../../../constants/style.dart';
import '../../../../widget/appBar/appbar_widget.dart';
import '../../../../widget/appBar/decorative_apbar_widget.dart';

class TeacherViewExamRoutine extends StatelessWidget {
  final String testType;
  final String selectedClass;
  const TeacherViewExamRoutine(
      {super.key, required this.testType, required this.selectedClass});

  @override
  Widget build(BuildContext context) {
    void showSuccessSnackbar() {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text('Exam Deleted successfully'),
          duration: Duration(seconds: 3), // Adjust the duration as needed
        ),
      );
    }

    double containerSize = MediaQuery.of(context).size.width / 8;
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
            "assets/flaticon/_exam.png",
            "Exam Routine",
            context,
            () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                // Additional Row for the top row of containers
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15)),
                          border: Border.all(),
                          color: deepBlue),
                      height: containerSize,
                      width: containerSize,
                      child: const Center(
                        child: Text(
                          "Subject",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration:
                          BoxDecoration(border: Border.all(), color: deepBlue),
                      height: containerSize,
                      width: containerSize,
                      child: const Center(
                        child: Text(
                          "Date",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(15)),
                          border: Border.all(),
                          color: deepBlue),
                      height: containerSize,
                      width: containerSize,
                      child: const Center(
                        child: Text(
                          "Time",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            FutureBuilder<ExamRoutineResponseModel>(
              future: ApiServices.viewExamRoutine(selectedClass, testType),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child:
                          CircularProgressIndicator()); // Show loading indicator
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.data == null) {
                  return const Center(child: Text('No Exam Found.'));
                } else {
                  ExamRoutineResponseModel? exam = snapshot.data;
                  log("Message= ${exam!.message.toString()}");
                  log("Status= ${exam.status.toString()}");

                  return GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 8,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(border: Border.all()),
                                height: containerSize,
                                width: containerSize,
                                child: Center(
                                  child: Text(exam
                                      .data!.examDetails![index].subject
                                      .toString()),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(border: Border.all()),
                                height: containerSize,
                                width: containerSize,
                                child: Center(
                                  child: Text(DateFormat('dd-MM-yyyy').format(
                                      DateTime.parse(exam
                                          .data!.examDetails![index].date
                                          .toString()))),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(border: Border.all()),
                                height: containerSize,
                                width: containerSize,
                                child: Center(
                                  child: Text(exam
                                      .data!.examDetails![index].time
                                      .toString()),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: exam.data!.examDetails!.length,
                  );
                }
              },
            ),
            const SizedBox(
              height: 5,
            ),
            FutureBuilder<ExamRoutineResponseModel>(
              future: ApiServices.viewExamRoutine(selectedClass, testType),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container();
                } else if (snapshot.hasError) {
                  return const Text('Error..');
                } else if (!snapshot.hasData || snapshot.data!.data == null) {
                  return const Text('');
                } else {
                  ExamRoutineResponseModel? exam = snapshot.data;

                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Remarks : ",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              Text("${exam!.data!.remarks}")
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "Want to delete the exam routine ? ",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        MyElevatedButton(
                          onPressed: () {
                            ApiServices.deleteExamRoutine(
                                    exam.data!.id.toString())
                                .whenComplete(() {
                              showSuccessSnackbar();
                              Navigator.pop(context);
                            });
                          },
                          child: const Text(
                            "Delete",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

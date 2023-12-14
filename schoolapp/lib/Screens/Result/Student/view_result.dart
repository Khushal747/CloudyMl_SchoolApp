import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_management_system/Services/api_services.dart';
import '../../../Models/Student/Result/student_see_result_model.dart';
import '../../../constants/style.dart';
import '../../../widget/appBar/decorative_apbar_widget.dart';

class StudentSeeOwnResult extends StatelessWidget {
  final String testType;
  const StudentSeeOwnResult({super.key, required this.testType});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var test;
    double containerSize = MediaQuery.of(context).size.width / 8;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          MediaQuery.of(context).size.height * 0.3,
        ),
        child: DecorativeAppBar(
          barHeight: MediaQuery.of(context).size.height * 0.24,
          barPad: MediaQuery.of(context).size.height * 0.20,
          radii: 30,
          background: Colors.white,
          gradient1: lightBlue,
          gradient2: deepBlue,
          extra: Container(
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Padding(
                padding:
                    EdgeInsets.only(top: height * 0.07, left: height * 0.03),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: height * 0.055, left: height * 0.02),
                child: Row(
                  children: [
                    Container(
                      width: height * 0.2,
                      height: height * 0.1,
                      child: Image.asset("assets/flaticon/result4.png"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: SizedBox(
                        width: height * 0.005,
                        child: Text("",
                            style: GoogleFonts.inter(
                                color: Colors.white,
                                letterSpacing: 1.0,
                                fontSize: height * 0.03,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
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
                          "Marks",
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
                          "Grade",
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
                          "Comments",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            FutureBuilder<StudentResultResponseModel>(
              future: ApiServices.studentSeeResult(testType),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(); // Show loading indicator
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.data == null) {
                  return const Text('No result found.');
                } else {
                  StudentResultResponseModel? result = snapshot.data;
                  log("Message= ${result!.message.toString()}");
                  log("Status= ${result.status.toString()}");

                  return GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 8,
                    ),
                    itemBuilder: (context, index) {
                      test = result.data!.subjects![index].grade.toString();
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
                                  child: Text(result
                                      .data!.subjects![index].subject
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
                                  child: Text(result
                                      .data!.subjects![index].marks
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
                                  child: Text(result
                                      .data!.subjects![index].grade
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
                                  child: Text(result
                                      .data!.subjects![index].comment
                                      .toString()),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: result.data!.subjects!.length,
                  );
                }
              },
            ),
            //..................
            const SizedBox(
              height: 5,
            ),
            FutureBuilder<StudentResultResponseModel>(
              future: ApiServices.studentSeeResult(testType),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(); // Show loading indicator
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.data == null) {
                  return const Text('');
                } else {
                  StudentResultResponseModel? resultDetails = snapshot.data;

                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.14,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Passing Percentage (%) - ${resultDetails!.data!.percentage.toString()}",
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text(
                              "Overall Grade - ${resultDetails.data!.overAllGrade.toString()}",
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text(
                              "Final Result - ${resultDetails.data!.result.toString()}",
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
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

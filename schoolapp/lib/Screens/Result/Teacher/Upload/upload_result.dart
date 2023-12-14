import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_management_system/Services/api_services.dart';
import 'package:school_management_system/Services/shared_services.dart';
import '../../../../constants/style.dart';
import '../../../../widget/Button/my_elevatedbutton.dart';
import '../../../../widget/Button/rectangle_elevatedbutton_card.dart';
import '../../../../widget/appBar/appbar_widget.dart';
import '../../../../widget/appBar/decorative_apbar_widget.dart';

class UploadResult extends StatefulWidget {
  final String selectedClass;
  final String selectedSetion;
  final String testType;
  final String studentRoll;
  final String fullMarks;
  final String passingMarks;
  const UploadResult({
    Key? key,
    required this.selectedClass,
    required this.selectedSetion,
    required this.testType,
    required this.studentRoll,
    required this.fullMarks,
    required this.passingMarks,
  });
  @override
  _UploadResultState createState() => _UploadResultState();
}

class _UploadResultState extends State<UploadResult> {
  bool check = false;
  List<PeriodData> resultData = [];
  TextEditingController subjectController = TextEditingController();
  TextEditingController marksController = TextEditingController();

  bool isEditing = false;
  PeriodData? selectedPeriod;

  void deletePeriod(int index) {
    setState(() {
      resultData.removeAt(index);
      clearTextFields();
    });
  }

  void updatePeriod() {
    setState(() {
      if (selectedPeriod != null) {
        selectedPeriod?.subject = subjectController.text;
        selectedPeriod?.marks = marksController.text;

        isEditing = false;
        clearTextFields();
      }
    });
  }

  void clearTextFields() {
    setState(() {
      subjectController.clear();
      marksController.clear();

      selectedPeriod = null;
      isEditing = false;
    });
  }

  void showSuccessSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Result uploaded successfully'),
        duration: Duration(seconds: 3), // Adjust the duration as needed
      ),
    );
  }

  void showErrorSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Student data not match'),
        duration: Duration(seconds: 3), // Adjust the duration as needed
      ),
    );
  }

  // void printDataInRequiredFormat() {
  //   Map<String, dynamic> postData = {
  //     "schoolName": SharedService.loginDetails()!.data!.data!.school.toString(),
  //     "class": widget.selectedClass,
  //     "section": widget.selectedSetion,
  //     "rollNumber": widget.studentRoll,
  //     "examType": widget.testType,
  //     "subjects": timetableData.map((subjects) {
  //       return {
  //         "Subject": subjects.subject,
  //         "Marks": subjects.marks,
  //         "outOffMarks": subjects.outOffMarks,
  //         "passingMarks": subjects.passingMarks,
  //       };
  //     }).toList(),
  //   };
  //   // print(postData);
  //   log(timetableData.toString());
  // }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
      body: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: width * 0.078,
                      right: width * 0.07,
                      top: width * 0.01),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Subject*",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color: const Color.fromARGB(255, 96, 96, 96),
                          ),
                        ),
                        TextField(
                          controller:
                              subjectController, // Fixed the controller name here
                          decoration: InputDecoration(
                            hintText: "Enter the subject ",
                            hintStyle: GoogleFonts.poppins(
                              fontSize: 12,
                              color: const Color.fromARGB(255, 135, 135, 135),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: width * 0.078,
                      right: width * 0.07,
                      top: width * 0.04),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Marks*",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color: const Color.fromARGB(255, 96, 96, 96),
                          ),
                        ),
                        TextField(
                          controller:
                              marksController, // Fixed the controller name here
                          decoration: InputDecoration(
                            hintText: "Enter the marks ",
                            hintStyle: GoogleFonts.poppins(
                              fontSize: 12,
                              color: const Color.fromARGB(255, 135, 135, 135),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                MyElevatedButton(
                  onPressed: () {
                    check = true;
                    if (isEditing) {
                      updatePeriod();
                    } else {
                      resultData.add(PeriodData(
                        subject: subjectController.text,
                        marks: marksController.text,
                        outOffMarks: widget.fullMarks,
                        passingMarks: widget.passingMarks,
                      ));
                    }
                    clearTextFields();
                  },
                  child: Text(
                    isEditing ? "Update" : "Add",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          check == false
              ? Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01,
                  ),
                  child: Text("Please add all Subjects and related marks"),
                )
              : Expanded(
                  child: ListView(
                    children: resultData.map((periodData) {
                      return Card(
                        child: ListTile(
                          tileColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: deepBlue,
                              ),
                              borderRadius: BorderRadius.circular(12)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Subject: ${periodData.subject}"),
                              Text("Marks: ${periodData.marks}"),
                              Text("Total Marks: ${widget.fullMarks}"),
                              Text("Passing Marks: ${widget.passingMarks}"),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  setState(() {
                                    subjectController.text = periodData.subject;
                                    marksController.text = periodData.marks;
                                    selectedPeriod = periodData;
                                    isEditing = true;
                                  });
                                },
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  deletePeriod(resultData.indexOf(periodData));
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
        ],
      ),
      persistentFooterButtons: [
        RecElevatedButton(
          onPressed: () {
            Map<String, dynamic> postData = {
              "schoolName":
                  SharedService.loginDetails()!.data!.data!.school.toString(),
              "class": widget.selectedClass,
              "section": widget.selectedSetion,
              "rollNumber": widget.studentRoll,
              "examType": widget.testType,
              "subjects": resultData.map((subjects) {
                return {
                  "Subject": subjects.subject,
                  "Marks": subjects.marks,
                  "outOffMarks": subjects.outOffMarks,
                  "passingMarks": subjects.passingMarks,
                };
              }).toList(),
            };

            log(postData.toString());
            ApiServices.uploadResultSpecificStudent(postData).then((value) {
              if (value == true) {
                showSuccessSnackbar();
                Navigator.pop(context);
              } else {
                showErrorSnackbar();
              }
            });
          },
          child: const Text(
            "SUBMIT",
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
        )
      ],
    );
  }
}

class PeriodData {
  String subject;
  String marks;
  String outOffMarks;
  String passingMarks;

  PeriodData({
    required this.subject,
    required this.marks,
    required this.outOffMarks,
    required this.passingMarks,
  });
}

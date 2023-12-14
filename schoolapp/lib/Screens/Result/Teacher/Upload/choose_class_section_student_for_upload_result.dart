import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_management_system/Screens/Result/Teacher/Upload/upload_result.dart';
import '../../../../../../constants/style.dart';
import '../../../../../../widget/Button/my_elevatedbutton.dart';
import '../../../../../../widget/appBar/appbar_widget.dart';
import '../../../../../../widget/appBar/decorative_apbar_widget.dart';

class ChooseClassSectionForUploadResult extends StatefulWidget {
  final String testType;
  const ChooseClassSectionForUploadResult({Key? key, required this.testType});

  @override
  State<ChooseClassSectionForUploadResult> createState() =>
      _ChooseClassForTakeAttendanceState();
}

class _ChooseClassForTakeAttendanceState
    extends State<ChooseClassSectionForUploadResult> {
  TextEditingController studentRoll = TextEditingController();
  TextEditingController fullMarks = TextEditingController();
  TextEditingController passingMarks = TextEditingController();
  String selectedClass = 'Choose Class';
  String selectedSection = 'Choose Section';

  List<String> classOptions = [
    'Choose Class',
    '1',
    '2',
    '3',
    "4",
    '5',
    '6',
    '7',
    "8",
    '9',
    '10',
    '11',
    "12",
  ];
  List<String> sectionOptions = ['Choose Section', 'A', 'B', 'C'];
  void showFailureSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.red,
        content: Text('Fill all the required fields'),
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.075,
                    ),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Select Standard",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: DropdownButtonFormField<String>(
                      value: selectedClass,
                      onChanged: (value) {
                        if (value != 'Choose Class') {
                          setState(() {
                            selectedClass = value!;
                          });
                        }
                      },
                      items: classOptions
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        hintText: "Class*",
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: deepBlue,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.03),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.075,
                      ),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Select Section",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: DropdownButtonFormField<String>(
                        value: selectedSection,
                        onChanged: (value) {
                          if (value != 'Choose Section') {
                            setState(() {
                              selectedSection = value!;
                            });
                          }
                        },
                        items: sectionOptions
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          hintText: "Section*",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: deepBlue,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: width * 0.078,
                    right: width * 0.07,
                    top: width * 0.078),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Student Roll*",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: const Color.fromARGB(255, 96, 96, 96),
                        ),
                      ),
                      TextField(
                        controller:
                            studentRoll, // Fixed the controller name here
                        decoration: InputDecoration(
                          hintText: "Enter student roll number",
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
                    top: width * 0.078),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Full Marks*",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: const Color.fromARGB(255, 96, 96, 96),
                        ),
                      ),
                      TextField(
                        controller: fullMarks, // Fixed the controller name here
                        decoration: InputDecoration(
                          hintText: "Enter full marks ",
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
                    top: width * 0.078),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Passing Marks*",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: const Color.fromARGB(255, 96, 96, 96),
                        ),
                      ),
                      TextField(
                        controller:
                            passingMarks, // Fixed the controller name here
                        decoration: InputDecoration(
                          hintText: "Enter passing marks",
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
                padding: EdgeInsets.only(left: 20, top: height * 0.05),
                child: MyElevatedButton(
                  child: Text(
                    'SUBMIT',
                    style:
                        TextStyle(color: Colors.white, fontSize: width * 0.05),
                  ),
                  onPressed: () {
                    String fullMarksValue = fullMarks.text;
                    String passingMarksValue = passingMarks.text;
                    String studentRollValue = studentRoll.text;
                    if (selectedClass == 'Choose Class' ||
                        selectedSection == 'Choose Section' ||
                        studentRoll.text.isEmpty ||
                        fullMarks.text.isEmpty ||
                        passingMarks.text.isEmpty) {
                      showFailureSnackbar();

                      return;
                    } else {
                      log("Selected Class= $selectedClass");
                      log("Selected Section = $selectedSection");
                      log("Full Marks= $fullMarksValue");
                      log("Passing Marks = $passingMarksValue");
                      log("Student Roll= $studentRollValue");

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UploadResult(
                            selectedClass: selectedClass,
                            selectedSetion: selectedSection,
                            testType: widget.testType,
                            fullMarks: fullMarksValue,
                            passingMarks: passingMarksValue,
                            studentRoll: studentRollValue,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

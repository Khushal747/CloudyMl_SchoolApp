import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../../../constants/style.dart';
import '../../../../../../../widget/Button/my_elevatedbutton.dart';
import '../../../../../../../widget/appBar/appbar_widget.dart';
import '../../../../../../../widget/appBar/decorative_apbar_widget.dart';
import 'upload_exam_routine.dart';

class TeacherChooseClassForUploadExamRoutine extends StatefulWidget {
  final String testType;
  const TeacherChooseClassForUploadExamRoutine(
      {super.key, required this.testType});

  @override
  State<TeacherChooseClassForUploadExamRoutine> createState() =>
      _ChooseClassForTakeAttendanceState();
}

class _ChooseClassForTakeAttendanceState
    extends State<TeacherChooseClassForUploadExamRoutine> {
  TextEditingController remarks = TextEditingController();
  String selectedClass = 'Choose Class';

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

  @override
  Widget build(BuildContext context) {
    void showFailureSnackbar() {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Fill all the required fields'),
          duration: Duration(seconds: 3),
        ),
      );
    }

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(300),
        child: DecorativeAppBar(
          barHeight: MediaQuery.of(context).size.height * 0.19,
          barPad: MediaQuery.of(context).size.height * 0.15,
          radii: 30,
          background: Colors.white,
          gradient1: lightBlue,
          gradient2: deepBlue,
          extra:
              appbar("assets/flaticon/_exam.png", "Examination", context, () {
            Navigator.pop(context);
          }),
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
                padding: EdgeInsets.only(
                    left: width * 0.078,
                    right: width * 0.07,
                    top: width * 0.078),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Remarks*",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: const Color.fromARGB(255, 96, 96, 96),
                        ),
                      ),
                      TextField(
                        controller: remarks,
                        maxLines: 2,
                        decoration: InputDecoration(
                          hintText: "Enter remarks for the exam",
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
                    if (selectedClass == 'Choose Class' ||
                        remarks.text.isEmpty) {
                      showFailureSnackbar();

                      return;
                    } else {
                      log("Class= ${selectedClass}");
                      log("Exam Type= ${widget.testType}");
                      log("Remarks= ${remarks.text}");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UploadExamRoutine(
                              selectedClass: selectedClass,
                              remarks: remarks.text,
                              testType: widget.testType,
                            ),
                          )).whenComplete(() => remarks.clear());
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

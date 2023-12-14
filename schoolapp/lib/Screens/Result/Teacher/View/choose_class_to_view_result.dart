import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_management_system/Screens/Attendance/Teacher/take_attandance.dart';
import '../../../../../constants/style.dart';
import '../../../../../widget/Button/my_elevatedbutton.dart';
import '../../../../../widget/appBar/appbar_widget.dart';
import '../../../../../widget/appBar/decorative_apbar_widget.dart';
import 'class_wise_result_view.dart';

class TeacherChooseClassForSeeResult extends StatefulWidget {
  final String testType;
  const TeacherChooseClassForSeeResult({Key? key, required this.testType});

  @override
  State<TeacherChooseClassForSeeResult> createState() =>
      _TeacherChooseClassForSeeResultState();
}

class _TeacherChooseClassForSeeResultState
    extends State<TeacherChooseClassForSeeResult> {
  String selectedClass = 'Choose Class'; // Set to default option

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
              Padding(
                padding: EdgeInsets.only(left: height * 0.03),
                child: const Text(
                  "Choose to view result class wise",
                  style: TextStyle(
                      color: Color.fromARGB(255, 93, 93, 93),
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.05),
                child: Column(
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
                    if (selectedClass == 'Choose Class') {
                      return; // Exit function if default values are selected
                    } else {
                      log("Selected Class= $selectedClass");

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ClassWiseResultView(
                            selectedClass: selectedClass,
                            testType: widget.testType,
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

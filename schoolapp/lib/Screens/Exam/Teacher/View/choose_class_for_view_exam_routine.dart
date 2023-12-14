import 'dart:developer';
import 'package:flutter/material.dart';
import '../../../../../../../constants/style.dart';
import '../../../../../../../widget/Button/my_elevatedbutton.dart';
import '../../../../../../../widget/appBar/appbar_widget.dart';
import '../../../../../../../widget/appBar/decorative_apbar_widget.dart';
import 'teacher_view_exam_routine.dart';

class TeacherChooseClassForViewExamRoutine extends StatefulWidget {
  final String testType;
  const TeacherChooseClassForViewExamRoutine(
      {super.key, required this.testType});

  @override
  State<TeacherChooseClassForViewExamRoutine> createState() =>
      _ChooseClassForTakeAttendanceState();
}

class _ChooseClassForTakeAttendanceState
    extends State<TeacherChooseClassForViewExamRoutine> {
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
                padding: EdgeInsets.only(left: 20, top: height * 0.05),
                child: MyElevatedButton(
                  child: Text(
                    'SUBMIT',
                    style:
                        TextStyle(color: Colors.white, fontSize: width * 0.05),
                  ),
                  onPressed: () {
                    if (selectedClass == 'Choose Class' ) {
                      return;
                    } else {
                      log("Class= ${selectedClass}");
                      log("Exam Type= ${widget.testType}");

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TeacherViewExamRoutine(
                              selectedClass: selectedClass,
                              testType: widget.testType,
                            ),
                          ));
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

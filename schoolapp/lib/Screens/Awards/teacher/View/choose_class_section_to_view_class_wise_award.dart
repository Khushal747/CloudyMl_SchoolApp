import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:school_management_system/Screens/Attendance/Teacher/take_attandance.dart';
import '../../../../constants/style.dart';
import '../../../../widget/Button/my_elevatedbutton.dart';
import '../../../../widget/appBar/appbar_widget.dart';
import '../../../../widget/appBar/decorative_apbar_widget.dart';
import '../../../Dashboard.dart';
import 'view_students_awards_screen_class_wise.dart';

class ChooseClassSectionForViewAwards extends StatefulWidget {
  const ChooseClassSectionForViewAwards({Key? key}) : super(key: key);

  @override
  State<ChooseClassSectionForViewAwards> createState() =>
      _ChooseClassForTakeAttendanceState();
}

class _ChooseClassForTakeAttendanceState
    extends State<ChooseClassSectionForViewAwards> {
  String selectedClass = 'Choose Class'; // Set to default option
  String selectedSection = 'Choose Section'; // Set to default option

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

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(300),
        child: DecorativeAppBar(
          barHeight: MediaQuery.of(context).size.height * 0.24,
          barPad: MediaQuery.of(context).size.height * 0.18,
          radii: 30,
          background: Colors.white,
          gradient1: lightBlue,
          gradient2: deepBlue,
          extra: appbar("assets/awards_trophy.png", "Awards", context, () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const Dashboard()));
          }),
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
                  "Choose to view awards class wise",
                  style: TextStyle(
                      color: Color.fromARGB(255, 93, 93, 93),
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.04),
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
                padding: EdgeInsets.only(top: height * 0.06),
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
                padding: EdgeInsets.only(left: 20, top: height * 0.05),
                child: MyElevatedButton(
                  child: Text(
                    'SUBMIT',
                    style:
                        TextStyle(color: Colors.white, fontSize: width * 0.05),
                  ),
                  onPressed: () {
                    if (selectedClass == 'Choose Class' ||
                        selectedSection == 'Choose Section') {
                      return; // Exit function if default values are selected
                    } else {
                      log("Selected Class= $selectedClass");
                      log("Selected Section = $selectedSection");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewAwardsOfClassScreen(
                            selectedClass: selectedClass,
                            selectedSection: selectedSection,
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

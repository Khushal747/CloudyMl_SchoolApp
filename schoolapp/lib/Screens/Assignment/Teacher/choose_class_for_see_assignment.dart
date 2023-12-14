// import 'package:flutter/material.dart';
// import 'package:school_management_system/Screens/Assignment/Teacher/see_own_uploaded_assignment.dart';
// import '../../../constants/style.dart';
// import '../../../widget/Button/Blue_Button.dart';

// class ChooseClassForViewAssignment extends StatefulWidget {
//   const ChooseClassForViewAssignment({Key? key}) : super(key: key);

//   @override
//   State<ChooseClassForViewAssignment> createState() =>
//       _ChooseClassForViewAssignmentState();
// }

// class _ChooseClassForViewAssignmentState
//     extends State<ChooseClassForViewAssignment> {
//   String selectedClass = 'Choose Class'; // Set to default option
//   String selectedSection = 'Choose Section'; // Set to default option

//   List<String> classOptions = [
//     'Choose Class',
//     '1',
//     '2',
//     '3',
//     "4",
//     '5',
//     '6',
//     '7',
//     "8",
//     '9',
//     '10',
//     '11',
//     "12",
//   ];
//   List<String> sectionOptions = ['Choose Section', 'A', 'B', 'C'];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Image.asset("assets/login_Appbar.png"),
//             Padding(
//               padding: EdgeInsets.only(
//                   top: MediaQuery.of(context).size.height * 0.09),
//               child: const Text(
//                 'View Assignment',
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold, fontSize: 30, color: Buttonc),
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Container(child: Image.asset("assets/_assignment.png")),
//             const SizedBox(
//               height: 20,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.06,
//               width: MediaQuery.of(context).size.width * 0.68,
//               child: DropdownButtonFormField<String>(
//                 value: selectedClass,
//                 onChanged: (value) {
//                   if (value != 'Choose Class') {
//                     setState(() {
//                       selectedClass = value!;
//                     });
//                   }
//                 },
//                 items:
//                     classOptions.map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//                 decoration: InputDecoration(
//                   prefixIcon: const Icon(
//                     Icons.man_sharp,
//                     color: Buttonc,
//                   ),
//                   hintText: "Class*",
//                   contentPadding:
//                       const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide: const BorderSide(
//                       color: Buttonc,
//                       width: 3,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.06,
//               width: MediaQuery.of(context).size.width * 0.68,
//               child: DropdownButtonFormField<String>(
//                 value: selectedSection,
//                 onChanged: (value) {
//                   if (value != 'Choose Section') {
//                     setState(() {
//                       selectedSection = value!;
//                     });
//                   }
//                 },
//                 items: sectionOptions
//                     .map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//                 decoration: InputDecoration(
//                   prefixIcon: const Icon(
//                     Icons.man_outlined,
//                     color: Buttonc,
//                   ),
//                   hintText: "Section*",
//                   contentPadding:
//                       const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide: const BorderSide(
//                       color: Buttonc,
//                       width: 3,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//             const SizedBox(
//               height: 80,
//             ),
//             SuperButton(
//               text: 'SUBMIT',
//               screen: () {
//                 if (selectedClass == 'Choose Class' ||
//                     selectedSection == 'Choose Section') {
//                   return; // Exit function if default values are selected
//                 } else {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => TeacherSeeOwnUploadedAssignment(
//                         section: selectedSection,
//                         wclass: selectedClass,
//                       ),
//                     ),
//                   );
//                 }
//               },
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Above one is Old design code

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:school_management_system/Screens/Assignment/Teacher/see_own_uploaded_assignment.dart';
import '../../../constants/style.dart';
import '../../../widget/Button/my_elevatedbutton.dart';
import '../../../widget/appBar/appbar_widget.dart';
import '../../../widget/appBar/decorative_apbar_widget.dart';
import '../../Dashboard.dart';

class ChooseClassForViewAssignment extends StatefulWidget {
  const ChooseClassForViewAssignment({Key? key}) : super(key: key);

  @override
  State<ChooseClassForViewAssignment> createState() =>
      _ChooseClassForTakeAttendanceState();
}

class _ChooseClassForTakeAttendanceState
    extends State<ChooseClassForViewAssignment> {
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
          barPad: MediaQuery.of(context).size.height * 0.19,
          radii: 30,
          background: Colors.white,
          gradient1: lightBlue,
          gradient2: deepBlue,
          extra: appbar(
              "assets/flaticon/_assignments.png", "Assignments", context, () {
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
                  "View Assignments",
                  style: TextStyle(
                      color: Color.fromARGB(255, 93, 93, 93),
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
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
                          // contentPadding: const EdgeInsets.symmetric(
                          //     vertical: 5, horizontal: 5),
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
                          // contentPadding: const EdgeInsets.symmetric(
                          //     vertical: 5, horizontal: 5),
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
                          builder: (context) => TeacherSeeOwnUploadedAssignment(
                            wclass: selectedClass,
                            section: selectedSection,
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

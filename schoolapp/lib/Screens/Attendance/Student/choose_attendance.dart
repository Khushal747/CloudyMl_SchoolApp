// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:school_management_system/widget/Button/Blue_Button.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../../Models/login_response_model.dart';
// import '../../../Services/shared_services.dart';
// import '../../../constants/style.dart';
// import 'Week_attendance_student.dart';
// import 'month_attendance_students.dart';
// import 'month_year_choose.dart';

// class StuChooseAttendance extends StatelessWidget {
//   const StuChooseAttendance({super.key});

//   @override
//   Widget build(BuildContext context) {
//     LoginData loginModelObject = LoginData();
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Buttonc,
//         title: Padding(
//           padding: EdgeInsets.only(left: 5),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "${SharedService.loginDetails()?.data!.data!.name.toString()}",
//                 style: TextStyle(color: Colors.white),
//               ),
//               Text(
//                 "Class: ${SharedService.loginDetails()?.data!.data!.dataClass.toString()}",
//                 style: TextStyle(color: Colors.grey),
//               ),
//               Text(
//                 "Roll: ${SharedService.loginDetails()?.data!.data!.rollNumber.toString()}",
//                 style: TextStyle(color: Colors.grey),
//               ),
//             ],
//           ),
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 50),
//             child: Image.asset(
//               "assets/student.png", // Replace with your image path
//               width: 90,
//               height: 90,
//             ),
//           ),
//         ],
//         toolbarHeight: 140, // Increase the height as needed
//       ),
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         color: Colors.grey[300],
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SuperButton(
//               text: "This Week",
//               screen: () {
//                 Navigator.of(context)
//                     .push(MaterialPageRoute(builder: (context) => ThisWeek()));
//               },
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             SuperButton(
//               text: "Month",
//               screen: () {
//                 Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) =>
//                         MonthYearSelectForSeeingAttendance()));
//               },
//               //   shade: true
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_management_system/Screens/Attendance/Student/Week_attendance_student.dart';
import 'package:school_management_system/Screens/Attendance/Student/month_year_choose.dart';
import 'package:school_management_system/Screens/Awards/teacher/Upload/upload_awards.dart';
import '../../../constants/style.dart';
import '../../../widget/appBar/appbar_widget.dart';
import '../../../widget/appBar/decorative_apbar_widget.dart';

class StuChooseAttendance extends StatelessWidget {
  const StuChooseAttendance({super.key});

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
          extra: appbar("assets/attendance_appbar.png", " Attendance", context,
              () {
            Navigator.pop(context);
          }),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Text(
                "Select one to move forward",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ThisWeek()));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.16,
                    decoration: BoxDecoration(
                        border: Border.all(color: deepBlue),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 5,
                            color: Colors.grey,
                            offset: Offset(0, 3),
                            //  spreadRadius: 3,
                          ),
                        ]),
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.14,
                            child:
                                Image.asset("assets/checking-attendance.png")),
                        Text(
                          "This Week",
                          style: GoogleFonts.inter(
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MonthYearSelectForSeeingAttendance()));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.16,
                    decoration: BoxDecoration(
                        border: Border.all(color: deepBlue),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 5,
                            color: Colors.grey,
                            offset: Offset(0, 3),
                            //  spreadRadius: 3,
                          ),
                        ]),
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.14,
                          child: Image.asset("assets/checking-attendance.png"),
                        ),
                        Text(
                          "Month Wise",
                          style: GoogleFonts.inter(
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

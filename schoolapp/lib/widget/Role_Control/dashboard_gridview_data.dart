import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:school_management_system/Screens/Assignment/Parent/assignment_view_page_parent.dart';
import 'package:school_management_system/Screens/Attendance/parent/choose_type_of_attendance_parent.dart';
import 'package:school_management_system/Screens/Awards/parent/parent_view_awards.dart';
import 'package:school_management_system/Screens/Events/parent/parent_view_event.dart';
import 'package:school_management_system/Screens/Exam/Student/student_choose_examtype.dart';
import 'package:school_management_system/Screens/Exam/parent/parent_select_exam_type.dart';
import 'package:school_management_system/Screens/Fees/student/student_view_fees_details.dart';
import 'package:school_management_system/Screens/Gallery/parent/parents_view_school_gallery.dart';
import 'package:school_management_system/Screens/Result/Student/select_resulttype.dart';
import 'package:school_management_system/Screens/Result/parent/parent_select_result_type.dart';
import 'package:school_management_system/Screens/routine/parent/parent_daily_timetable.dart';
import 'package:school_management_system/constants/style.dart';
import '../../Screens/Assignment/Student/assignment_start_page.dart';
import '../../Screens/Assignment/Teacher/assignment_options.dart';
import '../../Screens/Attendance/Student/choose_attendance.dart';
import '../../Screens/Attendance/Teacher/choose_class_section.dart';
import '../../Screens/Awards/student/student_view_awards.dart';
import '../../Screens/Awards/teacher/first_page_select_award_options.dart';
import '../../Screens/Events/teacher/select_event_options.dart';
import '../../Screens/Events/student/student_view_events.dart';
import '../../Screens/Exam/Teacher/choose_view_or_upload_exam.dart';
import '../../Screens/Fees/teacher/teacher_view_fees.dart';
import '../../Screens/Gallery/student/view_gallery_student.dart';
import '../../Screens/Gallery/teacher/select_gallery_options.dart';
import '../../Screens/Result/Teacher/first_page_select_result_options.dart';
import '../../Screens/Routine/student/days_routine.dart';
import '../../Screens/Routine/teacher/choose_class_for_set_timetable.dart';
import '../../Services/shared_services.dart';

class CategoryData {
  final String image;
  final String name;
  final Widget screen;

  CategoryData({required this.image, required this.name, required this.screen});
}

Widget getAttendanceScreen() {
  if (SharedService.loginDetails()?.data!.data!.role == "student") {
    log("student");
    return const StuChooseAttendance();
  } else if (SharedService.loginDetails()?.data!.data!.role == "Teacher") {
    log("Teacher");
    return const ChooseClassForTakeAttendance();
  } else {
    return const ParentChooseAttendance();
  }
}

Widget getAssignmentScreen() {
  if (SharedService.loginDetails()?.data!.data!.role == "student") {
    log("student");
    log(SharedService.loginDetails()?.data!.data!.role ?? "");
    return const StudentAssignmentChoose();
  }

  // changed by harsh : added to implement the navigation for parent section
  else if (SharedService.loginDetails()?.data!.data!.role == "parent") {
    log("Parent");
    log(SharedService.loginDetails()?.data!.data!.role ?? "");
    return const ParentAssignmentView();
  } else {
    log("Teacher");
    log(SharedService.loginDetails()?.data!.data!.role ?? "");
    return const TeacherAssignmentFirstPage();
  }
}

Widget getAwardstScreen() {
  if (SharedService.loginDetails()?.data!.data!.role == "student") {
    log("student");
    return const StudentViewAwards();
  } else if (SharedService.loginDetails()?.data!.data!.role == "Teacher") {
    log("Teacher");
    return const TeacherAwardOptions();
  } else {
    log("Teacher");
    return const ParentViewAwards();
  }
}

Widget getGalleryScreen() {
  if (SharedService.loginDetails()?.data!.data!.role == "student") {
    log("student");
    return const ViewGallery();
  } else if (SharedService.loginDetails()?.data!.data!.role == "Teacher") {
    log("Teacher");
    return const TeacherGalleryOptions();
  } else {
    log("student");
    return const ParentViewGallery();
  }
}

Widget getEventsScreen() {
  if (SharedService.loginDetails()?.data!.data!.role == "student") {
    log("student");
    return const StudentsViewEvents();
  } else if (SharedService.loginDetails()?.data!.data!.role == "parent") {
   
    return const ParentsViewEvents();
  } else {
     log("Teacher");
    return const TeacherEventOptions();
    
  }
}

Widget Routine() {
  if (SharedService.loginDetails()?.data!.data!.role == "student") {
    log("student");
    return const DayRoutine();
  } else if (SharedService.loginDetails()?.data?.data?.role == "parent") {
    return const ParentDailyRoutine();
  } else {
    log("Teacher");
    return const ChooseClassForSetTimetable();
  }
}

Widget FeeDetails() {
  if (SharedService.loginDetails()?.data!.data!.role == "Teacher") {
    log("Teacher");
    return const TeacherSeeFees();
  } else {
    log("student");
    return const StudentSeeFees();
  }
}

Widget Examination() {
  if (SharedService.loginDetails()?.data!.data!.role == "student") {
    log("student");
    return const SelectExamType();
  } else if (SharedService.loginDetails()?.data!.data!.role == "Teacher") {
    log("Teacher");
    return const TeacherExamOptions();
  } else {
    return const ParentSelectExamType();
  }
}

Widget Result() {
  if (SharedService.loginDetails()?.data!.data!.role == "student") {
    log("student");
    return const SelectResultType();
  } else if (SharedService.loginDetails()?.data!.data!.role == "Teacher") {
    log("Teacher");
    return const TeacherResultOptions();
  } else {
    return const ParentSelectResultType();
  }
}

List<CategoryData> categoryList = [
  CategoryData(
    image: 'assets/events_dashboard.png',
    name: 'Events',
    screen: getEventsScreen(),
  ),
  CategoryData(
    image: 'assets/exam.png',
    name: 'Examination',
    screen: Examination(),
  ),
  CategoryData(
    image: 'assets/fees.png',
    name: 'Fees',
    screen: FeeDetails(),
  ),
  CategoryData(
    image: 'assets/gallery.png',
    name: 'Gallery',
    screen: getGalleryScreen(),
  ),
  CategoryData(
    image: 'assets/routine.png',
    name: 'Timetable',
    screen: Routine(),
  ),
  CategoryData(
    image: 'assets/checking-attendance.png',
    name: 'Attendance',
    screen: getAttendanceScreen(),
    // screen: Dashboard(),
  ),
  CategoryData(
    image: 'assets/_assignment.png',
    name: 'Assignments',
    screen: getAssignmentScreen(),
  ),
  CategoryData(
    image: 'assets/result.png',
    name: 'Results',
    screen: Result(),
  ),
  CategoryData(
    image: 'assets/awards.png',
    name: 'Awards',
    screen: getAwardstScreen(),
  ),
];

class CategoryBox extends StatelessWidget {
  final CategoryData data;

  CategoryBox({
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => data.screen));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: deepBlue),
            // gradient: LinearGradient(
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            //   colors: [
            //     Colors.blue.shade300, // Lighter color on top
            //     Colors.blue.shade500, // Darker color on bottom
            //   ],
            // ),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(3, 3), // Offset in the Y direction
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                data.image,
                height: 50,
                width: 50,
              ),
              const SizedBox(height: 8.0),
              Text(
                data.name,
                style: const TextStyle(
                  fontFamily: 'UbuntuMedium',
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Text color
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

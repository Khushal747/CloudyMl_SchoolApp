import 'dart:developer';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:school_management_system/Screens/Events/teacher/View/detailed_completed_events_screen_teacher.dart';
import 'package:school_management_system/Screens/Events/teacher/View/detailed_upcoming_events_screen_teacher.dart';
import 'package:school_management_system/Screens/Events/teacher/View/registered_students_list.dart';
import 'package:school_management_system/Services/api_services.dart';
import '../../../../Models/Student/Events/view_events_response_model.dart';
import '../../../../constants/style.dart';
import '../../../../widget/appBar/appbar_widget.dart';
import '../../../../widget/appBar/decorative_apbar_widget.dart';
import '../../../../widget/teacher/Events/view_completed_events_card_teacher.dart';
import '../../../../widget/teacher/Events/view_upcoming_events_card_teacher.dart';

import 'package:intl/intl.dart';

class TeacherViewEvents extends StatefulWidget {
  const TeacherViewEvents({super.key});

  @override
  State<TeacherViewEvents> createState() => _EventScreen();
}

class _EventScreen extends State<TeacherViewEvents> {
  bool isUpcomingSelected = true;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            DecorativeAppBar(
              barHeight: MediaQuery.of(context).size.height * 0.24,
              barPad: MediaQuery.of(context).size.height * 0.19,
              radii: 30,
              background: Colors.white,
              gradient1: lightBlue,
              gradient2: deepBlue,
              extra: appbar("assets/add_events.png", " Events", context, () {
                Navigator.pop(context);
              }),
            ),
            Container(
              height: height * 0.07,
              width: width * 0.92,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                        color: const Color.fromARGB(255, 126, 126, 126),
                        blurRadius: 6)
                  ]),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isUpcomingSelected = true;
                        });
                      },
                      child: Container(
                        width: width * 0.46,
                        height: height * 0.07,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          gradient: isUpcomingSelected
                              ? const LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 252, 86, 46),
                                    Color.fromARGB(255, 255, 152, 127),
                                  ],
                                )
                              : const LinearGradient(
                                  colors: [Colors.white, Colors.white],
                                ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Upcoming Events',
                            style: GoogleFonts.inter(
                              fontSize: 15,
                              color: isUpcomingSelected
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isUpcomingSelected = false;
                        });
                      },
                      child: Container(
                        width: width * 0.46,
                        height: height * 0.07,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          gradient: !isUpcomingSelected
                              ? const LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 255, 152, 127),
                                    Color.fromARGB(255, 252, 86, 46),
                                  ],
                                )
                              : const LinearGradient(
                                  colors: [Colors.white, Colors.white],
                                ),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Completed Events',
                            style: GoogleFonts.inter(
                              fontSize: 15,
                              color: !isUpcomingSelected
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: isUpcomingSelected,
              child: FutureBuilder<StudentsViewEventsResponseModel>(
                future: ApiServices.viewSchoolEvents("Pending"),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child:
                            CircularProgressIndicator()); // Show loading indicator
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.data == null) {
                    return const Text('No events found.');
                  } else {
                    StudentsViewEventsResponseModel? upcomingEventsData =
                        snapshot.data;
                    String formatDateTime(String date) {
                      // Assuming the input date is in "yyyy-MM-dd" format
                      final inputFormat = DateFormat("yyyy-MM-dd");
                      final outputFormat = DateFormat(
                          "yyyy-MM-dd"); // Change this to your desired format
                      final parsedDate = inputFormat.parse(date);
                      return outputFormat.format(parsedDate);
                    }

                    return Expanded(
                      child: ListView.builder(
                        itemCount: upcomingEventsData!.data!.length,
                        itemBuilder: (context, index) {
                          if (index >= 0 &&
                              index < upcomingEventsData.data!.length) {
                            log(index.toString());

                            
                          } else {
                            log(upcomingEventsData.data!.length.toString());
                          }
                        },
                      ),
                    );
                  }
                },
              ),
            ),
            Visibility(
              visible: !isUpcomingSelected,
              child: FutureBuilder(
                future: ApiServices.viewSchoolEvents("Completed"),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator(); // Show loading indicator
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.data == null) {
                    return const Text('No events found.');
                  } else {
                    StudentsViewEventsResponseModel? completedEventsData =
                        snapshot.data;

                    String formatDateTime(String date) {
                      final inputFormat = DateFormat("yyyy-MM-dd");
                      final outputFormat = DateFormat(
                          "yyyy-MM-dd"); // Change this to your desired format
                      final parsedDate = inputFormat.parse(date);
                      return outputFormat.format(parsedDate);
                    }

                    return Expanded(
                      child: ListView.builder(
                        itemCount: completedEventsData!.data!.length,
                        itemBuilder: (context, index) {
                          return CompletedTeacherEventCard(
                            imglink: completedEventsData
                                .data![index].uploadedImage![index].link
                                .toString(),
                            heading: completedEventsData.data![index].eventName
                                .toString(),
                            date: formatDateTime(completedEventsData
                                .data![index].date
                                .toString()),
                            time: completedEventsData.data![index].eventTime
                                .toString(),
                            onPressed: () {
                              List<String> completedEventsPics = [];
                              for (var i = 0;
                                  i <
                                      completedEventsData
                                          .data![index].uploadedImage!.length;
                                  i++) {
                                completedEventsPics.add(completedEventsData
                                    .data![index].uploadedImage![i].link
                                    .toString());
                              }
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    CompletedDetailsEventScreenTeacher(
                                  imglink: completedEventsData
                                      .data![index].uploadedImage![index].link
                                      .toString(),
                                  heading: completedEventsData
                                      .data![index].eventName
                                      .toString(),
                                  des: completedEventsData
                                      .data![index].description
                                      .toString(),
                                  eligibleClass: completedEventsData
                                      .data![index].eligibleClass
                                      .toString(),
                                  date: completedEventsData.data![index].date
                                      .toString(),
                                  time: completedEventsData
                                      .data![index].eventTime
                                      .toString(),
                                  remark: completedEventsData
                                      .data![index].remark
                                      .toString(),
                                  eventPics: completedEventsPics,
                                  eventID: completedEventsData.data![index].id
                                      .toString(),
                                ),
                              ));
                            },
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ));
  }
}

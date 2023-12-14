import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:school_management_system/Screens/Dashboard.dart';
import 'package:school_management_system/widget/appBar/appbar_widget.dart';
import 'package:school_management_system/widget/appBar/decorative_apbar_widget.dart';
import '../../../Models/Student/day_Routine_response_medel.dart';
import '../../../Services/api_services.dart';
import '../../../constants/style.dart';

class DayRoutine extends StatefulWidget {
  const DayRoutine({Key? key}) : super(key: key);

  @override
  State<DayRoutine> createState() => _DayRoutineState();
}

class _DayRoutineState extends State<DayRoutine> {
  List<bool> isExpandedList = List.filled(6, false);

  @override
  Widget build(BuildContext context) {
    double containerSize = MediaQuery.of(context).size.width / 8;
    return SafeArea(
      child: Scaffold(
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
            extra: appbar(
                "assets/flaticon/_timetable.png", "Timetable", context, () {
              Navigator.pop(context);
            }),
          ),
        ),
        body: FutureBuilder<StudentEachdayRoutineModel>(
          future: ApiServices.StudentEachDayRoutine(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (!snapshot.hasData) {
              return Center(child: Text("No data found"));
            } else {
              StudentEachdayRoutineModel dailyRoutine = snapshot.data;
              log("message");
              log(dailyRoutine.data.toString());
              return Container(
                child: ListView.builder(
                  itemCount: dailyRoutine.data!.timeTable!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ExpansionTile(
                      leading: CircleAvatar(
                        backgroundColor: deepBlue,
                        radius: 9,
                      ),
                      title: Text(
                        dailyRoutine.data!.timeTable![index].day.toString(),
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Row(
                            // Additional Row for the top row of containers
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(), color: Buttonc),
                                  height: containerSize,
                                  width: containerSize,
                                  child: const Center(
                                    child: Text(
                                      "Period",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(), color: Buttonc),
                                  height: containerSize,
                                  width: containerSize,
                                  child: const Center(
                                    child: Text(
                                      "Start Time",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(), color: Buttonc),
                                  height: containerSize,
                                  width: containerSize,
                                  child: const Center(
                                    child: Text(
                                      "End Time",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(), color: Buttonc),
                                  height: containerSize,
                                  width: containerSize,
                                  child: const Center(
                                    child: Text(
                                      "Subject",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        GridView.builder(
                          shrinkWrap:
                              true, // Add this to fix the issue with GridView
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 8,
                          ),
                          itemBuilder: (context, index1) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration:
                                          BoxDecoration(border: Border.all()),
                                      height: containerSize,
                                      width: containerSize,
                                      child: Center(
                                        child: Text(
                                          dailyRoutine.data!.timeTable![index]
                                              .timeTable![index1].period!.period
                                              .toString(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration:
                                          BoxDecoration(border: Border.all()),
                                      height: containerSize,
                                      width: containerSize,
                                      child: Center(
                                        child: Text(dailyRoutine
                                            .data!
                                            .timeTable![index]
                                            .timeTable![index1]
                                            .period!
                                            .startTime
                                            .toString()),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration:
                                          BoxDecoration(border: Border.all()),
                                      height: containerSize,
                                      width: containerSize,
                                      child: Center(
                                        child: Text(dailyRoutine
                                            .data!
                                            .timeTable![index]
                                            .timeTable![index1]
                                            .period!
                                            .endTime
                                            .toString()),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration:
                                          BoxDecoration(border: Border.all()),
                                      height: containerSize,
                                      width: containerSize,
                                      child: Center(
                                        child: Text(dailyRoutine
                                            .data!
                                            .timeTable![index]
                                            .timeTable![index1]
                                            .period!
                                            .subject
                                            .toString()),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: dailyRoutine
                              .data!.timeTable![index].timeTable!.length,
                        ),
                      ],
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

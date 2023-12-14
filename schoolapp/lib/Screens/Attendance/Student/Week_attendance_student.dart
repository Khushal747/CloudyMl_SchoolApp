import 'package:flutter/material.dart';
import 'package:school_management_system/widget/appBar/appbar_widget.dart';
import 'package:school_management_system/widget/appBar/decorative_apbar_widget.dart';
import '../../../Models/Student/week_attendance_student_model.dart';
import '../../../Services/api_services.dart';
import '../../../Services/shared_services.dart';
import '../../../constants/style.dart';

class ThisWeek extends StatelessWidget {
  const ThisWeek({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
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
            extra: appbar("assets/attendance_appbar.png", " This Week", context,
                () {
              Navigator.pop(context);
            }),
          ),
        ),
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: double.infinity,
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  "Your attendance of this week",
                  style: TextStyle(
                      fontSize: width * 0.055, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.53,
            child: FutureBuilder(
              future: ApiServices.StudentWeekAttendance(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (snapshot.data?.data?.data?.length == 0) {
                  return const Center(child: Text("No data available"));
                } else {
                  StudentWeeklyAttendanceModel? attendanceData = snapshot.data;

                  // Reverse the list before displaying it
                  final reversedData =
                      attendanceData!.data!.data!.reversed.toList();

                  return ListView.separated(
                    itemCount: reversedData.length,
                    separatorBuilder: (context, index1) => const Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    itemBuilder: (context, index) {
                      String? attendance = reversedData[index].attendance;

                      return ListTile(
                        title: Text(
                          "${reversedData[index].day}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: attendance == "present"
                            ? const Text(
                                "P",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              )
                            : const Text(
                                "A",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                      );
                    },
                  );
                }
              },
            ),
          ),
          FutureBuilder<StudentWeeklyAttendanceModel>(
            future: ApiServices.StudentWeekAttendance(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container();
              } else if (snapshot.hasError) {
                return const Center(child: Text("Error.."));
              } else if (!snapshot.hasData ||
                  snapshot.data?.data?.data?.length == 0) {
                return const Center(child: Text(""));
              } else {
                final totalData = snapshot.data!;

                return Column(
                  children: [
                    const Divider(),
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.05),
                      child: Column(
                        children: [
                          SizedBox(
                            height: width * 0.05,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Total Present: ",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              if (totalData.data!.totalPresent == null)
                                const Text("")
                              else
                                Text(
                                  "${totalData.data!.totalPresent}",
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 22,
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Total Absent: ",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              if (totalData.data!.totalAbsent == null)
                                const Text("")
                              else
                                Text(
                                  "${totalData.data!.totalAbsent}",
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 22,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
            },
          )
        ])));
  }
}

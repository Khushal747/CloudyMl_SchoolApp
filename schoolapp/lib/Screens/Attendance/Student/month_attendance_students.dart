import 'package:flutter/material.dart';
import 'package:school_management_system/widget/appBar/appbar_widget.dart';
import '../../../Models/Student/month_attendance_student_response_model.dart';
import '../../../Services/api_services.dart';
import '../../../Services/shared_services.dart';
import '../../../constants/style.dart';
import '../../../widget/appBar/decorative_apbar_widget.dart';

class MonthAttendance extends StatelessWidget {
  final String month;
  final String year;

  const MonthAttendance({super.key, required this.month, required this.year});

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
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Date",
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Attendance",
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: FutureBuilder<StudentMonthlyAttendanceModel>(
                future: ApiServices.StudentMonthlyAttendance(month, year),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text("Error..."));
                  } else if (!snapshot.hasData ||
                      snapshot.data!.data!.data!.isEmpty) {
                    return const Center(child: Text("No data found"));
                  } else {
                    StudentMonthlyAttendanceModel? monthAttDate = snapshot.data;
                    if (monthAttDate != null) {
                      return ListView.separated(
                        separatorBuilder: (context, index) {
                          return const Divider(
                            color: Colors.black,
                            thickness: 1,
                          );
                        },
                        itemCount: monthAttDate.data!.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          var attendance =
                              monthAttDate.data!.data![index].attendance;
                          return ListTile(
                              title: Text(
                                monthAttDate.data!.data![index].date.toString(),
                              ),
                              trailing: attendance == "present"
                                  ? const Text(
                                      "P",
                                      style: TextStyle(
                                          color: Colors.green, fontSize: 20),
                                    )
                                  : const Text("A",
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 20)));
                        },
                      );
                    } else {
                      return const Center(child: Text("No data found"));
                    }
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

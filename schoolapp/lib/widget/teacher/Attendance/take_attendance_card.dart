import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Models/Teacher/Attendance/attendance_submit_model.dart';
import '../../../Services/Provider/attendance_provider.dart';

class TakeAttendanceCard extends StatefulWidget {
  final int index;

  const TakeAttendanceCard({Key? key, required this.index}) : super(key: key);

  @override
  State<TakeAttendanceCard> createState() => _TakeAttendanceCardState();
}

class _TakeAttendanceCardState extends State<TakeAttendanceCard> {
  AttendanceStoreModel? model1;

  var datetime = DateTime.daysPerWeek;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.width;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5, left: 10),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.95,
            height: height * 0.31,
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.05, vertical: width * 0.02),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 177, 177, 177),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Consumer<AttendanceProvider>(
                builder: (context, providerr, child) {
              return Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // CircleAvatar(
                      //   radius: 20,
                      //   backgroundColor: Buttonc,
                      //   child: ClipOval(
                      //     child: Text(
                      //       widget.model.firstChar ?? '',
                      //       style: TextStyle(color: Colors.white),
                      //     ), // Access widget's properties using widget.
                      //   ),
                      // ),
                      const SizedBox(width: 10),
                      Expanded(
                        // Wrap the Column with Expanded
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              providerr.attendanceResponseModel!
                                      .data![widget.index].name ??
                                  "", // Access model's properties using widget.
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            //    const SizedBox(height: 5),
                            Text(
                              providerr.attendanceResponseModel!
                                  .data![widget.index].rollNumber
                                  .toString(), // Access widget's properties using widget.
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: Colors.black,
                                  ),
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                              MediaQuery.of(context).size.width * 0.26,
                              MediaQuery.of(context).size.height * 0.05),
                          backgroundColor: providerr.attendanceResponseModel!
                                      .data![widget.index].attendance ==
                                  "present"
                              ? Colors.green
                              : Colors.white,
                        ),
                        onPressed: () {
                          providerr.updateAttendanceList(
                              attendanceStatus: "present", index: widget.index);
                        },
                        child: Text(
                          "Present",
                          style: TextStyle(
                              fontSize: width * 0.035, color: Colors.black),
                        ),
                      ),
                      OutlinedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                              MediaQuery.of(context).size.width * 0.26,
                              MediaQuery.of(context).size.height * 0.05),
                          backgroundColor: providerr.attendanceResponseModel!
                                      .data![widget.index].attendance ==
                                  "absent"
                              ? Colors.red
                              : Colors.white,
                        ),
                        onPressed: () {
                          providerr.updateAttendanceList(
                              attendanceStatus: "absent", index: widget.index);
                        },
                        child: Text(
                          "Absent",
                          style: TextStyle(
                              fontSize: width * 0.035, color: Colors.black),
                        ),
                      ),
                      OutlinedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                              MediaQuery.of(context).size.width * 0.26,
                              MediaQuery.of(context).size.height * 0.05),
                          backgroundColor: providerr.attendanceResponseModel!
                                      .data![widget.index].attendance ==
                                  "leave"
                              ? Colors.blue
                              : Colors.white,
                        ),
                        onPressed: () {
                          providerr.updateAttendanceList(
                              attendanceStatus: "leave", index: widget.index);
                        },
                        child: Text(
                          "Leave",
                          style: TextStyle(
                              fontSize: width * 0.035, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

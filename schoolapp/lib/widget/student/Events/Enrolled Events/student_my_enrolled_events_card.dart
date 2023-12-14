import 'package:flutter/material.dart';
import '../../../../constants/style.dart';

class StudentMyEnrolledEventsCard extends StatelessWidget {
  final String eventHeading;
  final String eventDate;
  final String eventTime;

  const StudentMyEnrolledEventsCard({
    super.key,
    required this.eventHeading,
    required this.eventDate,
    required this.eventTime,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding:
          EdgeInsets.only(left: width * 0.05, right: width * 0.05, bottom: 15),
      child: Container(
        height: height * 0.16,
        width: width * 0.2,
        decoration: BoxDecoration(
          border: Border.all(color: deepBlue),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(blurRadius: 4, color: Colors.grey, offset: Offset(0, 3))
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(
                      "Event Name :",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " ${eventHeading}",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(
                      "Date :",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " ${eventDate}",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(
                      "Time :",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " ${eventTime}",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: width * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

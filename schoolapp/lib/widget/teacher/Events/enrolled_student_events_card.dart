import 'package:flutter/material.dart';
import '../../../constants/style.dart';

class EventEnrollStudentsCard extends StatelessWidget {
  final String studentName;
  final String studentRoll;
  final String studentClass;
  final String studentSection;
  final String studentPhone;
  final String studentEmail;

  const EventEnrollStudentsCard({
    super.key,
    required this.studentName,
    required this.studentRoll,
    required this.studentClass,
    required this.studentSection,
    required this.studentPhone,
    required this.studentEmail,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding:
          EdgeInsets.only(left: width * 0.05, right: width * 0.05, bottom: 15),
      child: Container(
        height: height * 0.26,
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
                      "Name :",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " ${studentName}",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(
                      "Email :",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " ${studentEmail}",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(
                      "Phone :",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " ${studentPhone}",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(
                      "Class :",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " $studentClass",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(
                      "Section :",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " $studentSection",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(
                      "Roll :",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " $studentRoll",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.w500),
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

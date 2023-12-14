import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:school_management_system/constants/style.dart';
import 'package:school_management_system/widget/Button/my_elevatedbutton.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Screens/Assignment/Student/submit_assignment.dart';
import '../../../Services/Url_launcher.dart/method.dart';

class StudentPendingAssignmentCard extends StatelessWidget {
  final String subject;
  final String givenDate;
  final String submitDate;
  final String docUrl;
  final String assignmentID;

  const StudentPendingAssignmentCard({
    super.key,
    required this.subject,
    required this.givenDate,
    required this.submitDate,
    required this.docUrl,
    required this.assignmentID,
  });

  @override
  Widget build(BuildContext context) {
    LaunceToWeb Launceweb = LaunceToWeb();
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
              blurRadius: 5,
              color: Colors.grey,
              spreadRadius: 2,
              offset: Offset(2, 8))
        ],
        border: Border.all(color: deepBlue),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text("Given Date : ",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontWeight: FontWeight.bold)),
                    Text(givenDate,
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                Row(
                  children: [
                    const Text("Submit Date : ",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontWeight: FontWeight.bold)),
                    Text(submitDate,
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Text(
                "Subject : ",
                style: TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(5, 5, 4, 1),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                subject,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyElevatedButton(
                onPressed: () {
                  log("View Assignment Success");
                  log(launchUrl.toString());
                  Launceweb.launchweb(docUrl);
                },
                child: const Text(
                  'View File',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              MyElevatedButton(
                onPressed: () {
                  log(assignmentID);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => StudentSubmitAssignment(
                            submitAssignmentID: assignmentID,
                          )));
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

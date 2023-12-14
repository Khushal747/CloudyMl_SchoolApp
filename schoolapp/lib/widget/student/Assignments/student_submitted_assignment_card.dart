import 'package:flutter/material.dart';
import 'package:school_management_system/constants/style.dart';
import 'package:school_management_system/widget/Button/Blue_Button.dart';
import 'package:school_management_system/widget/Button/my_elevatedbutton.dart';

import '../../../Services/Url_launcher.dart/method.dart';

class StudentSubmittedAssignmentCard extends StatelessWidget {
  final String subject;
  final String Submitdate;
  final String file;

  const StudentSubmittedAssignmentCard({
    super.key,
    required this.subject,
    required this.Submitdate,
    required this.file,
  });

  @override
  Widget build(BuildContext context) {
    LaunceToWeb openWeb = LaunceToWeb();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 150,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              border: Border.all(color: deepBlue, width: 2)),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                "Subject : ${subject}",
                style: const TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "Submit date : ${Submitdate}",
                style: const TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              MyElevatedButton(
                  onPressed: () {
                    openWeb.launchweb(file);
                  },
                  child: const Text(
                    "View File",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}

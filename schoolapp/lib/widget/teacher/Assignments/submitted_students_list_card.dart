import 'package:flutter/material.dart';
import 'package:school_management_system/constants/style.dart';
import 'package:school_management_system/widget/Button/my_elevatedbutton.dart';
import '../../../Services/Url_launcher.dart/method.dart';

class TeacherSubmittedAssignmentCard extends StatelessWidget {
  final String SubmitDate;
  final String name;
  final String roll;
  final String file;
  final String fileLink;

  const TeacherSubmittedAssignmentCard({
    super.key,
    required this.SubmitDate,
    required this.name,
    required this.roll,
    required this.file,
    required this.fileLink,
  });

  @override
  Widget build(BuildContext context) {
    LaunceToWeb Launceweb = LaunceToWeb();
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              blurRadius: 5,
              color: Colors.grey,
              spreadRadius: 2,
              offset: Offset(2, 8))
        ],
        color: Colors.white,
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
                    const Text("Date : ",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontWeight: FontWeight.bold)),
                    Text(SubmitDate,
                        style:
                            const TextStyle(fontSize: 18, color: Colors.grey)),
                  ],
                ),
                Row(
                  children: [
                    const Text("Name : ",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontWeight: FontWeight.bold)),
                    Text(name,
                        style:
                            const TextStyle(fontSize: 18, color: Colors.grey)),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Text("Roll : ",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontWeight: FontWeight.bold)),
                    Text(roll,
                        style:
                            const TextStyle(fontSize: 18, color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyElevatedButton(
                onPressed: () {
                  Launceweb.launchweb(fileLink);
                },
                child: const Text(
                  'View Submitted File',
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

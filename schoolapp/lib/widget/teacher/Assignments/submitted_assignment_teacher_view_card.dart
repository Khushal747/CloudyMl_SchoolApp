import 'package:flutter/material.dart';

import '../../../constants/style.dart';

class TViewAssignmentCard extends StatelessWidget {
  TViewAssignmentCard({
    Key? key,
    required this.name,
    required this.roll,
    required this.clas,
    required this.section,
    required this.onPress,
  }) : super(key: key);

  final String name;
  final String roll;
  final String clas;
  final String section;
  Function onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width / 9,
          right: MediaQuery.of(context).size.width / 9,
          top: 20),
      child: Container(
        height: MediaQuery.of(context).size.width / 2,
        width: MediaQuery.of(context).size.width * 1,
        decoration: BoxDecoration(
          border: Border.all(),
          color: Colors.grey[200],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                "Name: $name",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Flexible(
              child: Text(
                "Roll: $roll",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Flexible(
              child: Text(
                "Class: $clas",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Flexible(
              child: Text(
                "Section: $section",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              
            ),
            ElevatedButton(
              onPressed: () {
                onPress();
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(
                  MediaQuery.of(context).size.width * 0.4,
                  MediaQuery.of(context).size.height * 0.05,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                backgroundColor: Buttonc,
              ),
              child: const Text(
                "View File",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'dart:developer';
import 'package:flutter/material.dart';
import '../../../constants/style.dart';
import '../../../widget/teacher/Assignments/submitted_assignment_teacher_view_card.dart';

class TeacherSeeAssignment extends StatelessWidget {
  const TeacherSeeAssignment({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "View Assignment",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        toolbarHeight: MediaQuery.of(context).size.height * 0.2,
        backgroundColor: Buttonc,
        actions: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
                height: 70, width: 70, child: Image.asset("assets/ass.png")),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return TViewAssignmentCard(
            clas: '7',
            section: "A",
            name: "Ajay Nandi",
            roll: "10229801",
            onPress: () {
              log("Pressed");
            },
          );
        },
      ),
    );
  }
}

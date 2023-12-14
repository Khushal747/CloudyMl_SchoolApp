import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/style.dart';
import '../../../widget/appBar/appbar_widget.dart';
import '../../../widget/appBar/decorative_apbar_widget.dart';
import 'Upload/teacher_choose_examtype.dart';
import 'View/student_choose_examtype.dart';

class TeacherExamOptions extends StatelessWidget {
  const TeacherExamOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          MediaQuery.of(context).size.height * 0.3,
        ),
        child: DecorativeAppBar(
          barHeight: MediaQuery.of(context).size.height * 0.255,
          barPad: MediaQuery.of(context).size.height * 0.19,
          radii: 30,
          background: Colors.white,
          gradient1: lightBlue,
          gradient2: deepBlue,
          extra: appbar("assets/flaticon/_exam.png", " Exam", context, () {
            Navigator.pop(context);
          }),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Text(
                "Select one to move forward",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const TeacherSelectExamType()));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.16,
                    decoration: BoxDecoration(
                        border: Border.all(color: deepBlue),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 5,
                            color: Colors.grey,
                            offset: Offset(0, 3),
                            //  spreadRadius: 3,
                          ),
                        ]),
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.14,
                          child: Image.asset("assets/upload.png"),
                        ),
                        Text(
                          "Upload Routine",
                          style: GoogleFonts.inter(
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StudentSelectExamType()));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.16,
                    decoration: BoxDecoration(
                        border: Border.all(color: deepBlue),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 5,
                            color: Colors.grey,
                            offset: Offset(0, 3),
                            //  spreadRadius: 3,
                          ),
                        ]),
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.14,
                          child: Image.asset("assets/view.png"),
                        ),
                        Text(
                          "View Routine",
                          style: GoogleFonts.inter(
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

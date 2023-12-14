import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_management_system/Screens/Awards/teacher/Upload/upload_awards.dart';
import '../../../../constants/style.dart';
import '../../../../widget/appBar/appbar_widget.dart';
import '../../../../widget/appBar/decorative_apbar_widget.dart';
import '../../../Awards/teacher/View/choose_class_section_to_view_class_wise_award.dart';
import '../Student/student_notice_screen.dart';
import 'notice_upload.dart';

class TeacherNoticeOptions extends StatelessWidget {
  const TeacherNoticeOptions({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
          extra: Container(
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Padding(
                padding:
                    EdgeInsets.only(top: height * 0.08, left: height * 0.08),
                child: Row(
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      child: Image.asset("assets/add_events.png"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: SizedBox(
                        width: height * 0.3,
                        child: Text("Notice",
                            style: GoogleFonts.inter(
                                color: Colors.white,
                                letterSpacing: 1.0,
                                fontSize: height * 0.03,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
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
                            builder: (context) => UploadNotice()));
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
                          "Upload Notice",
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
                            builder: (context) => const ViewNoticeScreen()));
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
                          "View Notice",
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

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_management_system/Screens/Gallery/student/view_gallery_student.dart';
import 'package:school_management_system/Screens/Gallery/teacher/gallery_upload.dart';
import 'package:school_management_system/constants/style.dart';
import '../../../widget/appBar/appbar_widget.dart';
import '../../../widget/appBar/decorative_apbar_widget.dart';
import '../../Dashboard.dart';

class TeacherGalleryOptions extends StatefulWidget {
  const TeacherGalleryOptions({Key? key}) : super(key: key);

  @override
  State<TeacherGalleryOptions> createState() => _UploadGalleryState();
}

class _UploadGalleryState extends State<TeacherGalleryOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(400),
        child: DecorativeAppBar(
          barHeight: MediaQuery.of(context).size.height * 0.24,
          barPad: MediaQuery.of(context).size.height * 0.19,
          radii: 30,
          background: Colors.white,
          gradient1: lightBlue,
          gradient2: deepBlue,
          extra: appbar("assets/gallery2.png", "School Gallery", context, () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const Dashboard()));
          }),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
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
                          builder: (context) => const UploadGallery()));
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.14,
                        child: Image.asset("assets/upload.png"),
                      ),
                      Text(
                        "Upload Photo",
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
                          builder: (context) => const ViewGallery()));
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
                        "View Gallery",
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
            )
          ]),
        ),
      ),
    );
  }
}

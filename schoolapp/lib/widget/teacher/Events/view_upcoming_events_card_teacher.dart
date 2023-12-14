import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Button/my_elevatedbutton.dart';

class TeacherEventCard extends StatelessWidget {
  final String imglink;
  final String heading;
  final String date;
  final String time;
  final VoidCallback onPressed;
  final VoidCallback onPressedEnrolledStudents;
  const TeacherEventCard(
      {super.key,
      required this.imglink,
      required this.heading,
      required this.date,
      required this.time,
      required this.onPressed,
      required this.onPressedEnrolledStudents});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0, left: 10, right: 10),
      child: Container(
        height: height * 0.3,
        //  width: width * 0.5,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: const [
              BoxShadow(
                  color: const Color.fromARGB(255, 118, 118, 118),
                  blurRadius: 8),
            ]),
        //  color: Colors.amber,
        child: Row(children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(13),
              bottomLeft: Radius.circular(13),
            ),
            child: Container(
              width: width * 0.36,
              height: double.infinity,
              child: Image.network(
                imglink,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 4, top: 8),
                child: Container(
                  //color: Colors.blue,
                  width: width * 0.55,
                  child: Text(
                    heading,
                    style: GoogleFonts.inter(
                        fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, left: 8),
                child: Container(
                    width: width * 0.55,
                    child: Text(
                      "Date: $date",
                      style: GoogleFonts.inter(
                        fontSize: 15,
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, left: 8),
                child: Container(
                    width: width * 0.55,
                    child: Text(
                      "Time : $time",
                      style: GoogleFonts.inter(
                        fontSize: 15,
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyElevatedButton(
                      width: height * 0.24,
                      onPressed: () {
                        onPressed();
                      },
                      child: Text(
                        "View more",
                        style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    MyElevatedButton(
                      width: height * 0.24,
                      onPressed: () {
                        onPressedEnrolledStudents();
                      },
                      child: Text(
                        "Enrolled Students",
                        style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}

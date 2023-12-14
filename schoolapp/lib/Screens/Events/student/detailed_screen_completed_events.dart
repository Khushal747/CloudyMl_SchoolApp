import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/style.dart';
import '../../../widget/appBar/appbar_widget.dart';
import '../../../widget/appBar/decorative_apbar_widget.dart';
import '../../Dashboard.dart';

class CompletedDetailsEventScreen extends StatefulWidget {
  final String imglink;
  final String des;
  final String eligibleClass;
  final String time;
  final String date;
  final List<String> eventPics;
  final String remark;
  final String heading;
  final String eventID;
  const CompletedDetailsEventScreen({
    super.key,
    required this.imglink,
    required this.des,
    required this.eligibleClass,
    required this.time,
    required this.date,
    required this.eventPics,
    required this.remark,
    required this.heading,
    required this.eventID,
  });

  @override
  State<CompletedDetailsEventScreen> createState() =>
      _CompletedDetailsEventScreenState();
}

class _CompletedDetailsEventScreenState
    extends State<CompletedDetailsEventScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            DecorativeAppBar(
              barHeight: MediaQuery.of(context).size.height * 0.24,
              barPad: MediaQuery.of(context).size.height * 0.19,
              radii: 30,
              background: Colors.white,
              gradient1: lightBlue,
              gradient2: deepBlue,
              extra: appbar("assets/add_events.png", " Events", context, () {
                Navigator.pop(context);
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Container(
                height: height * 0.24,
                width: width * 0.93,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                    boxShadow: const [
                      BoxShadow(
                          color: const Color.fromARGB(255, 118, 118, 118),
                          blurRadius: 8)
                    ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: Image.network(
                    widget.imglink,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              width: width * 0.93,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 8),
                      child: Text(
                        widget.heading,
                        style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: const Color.fromARGB(255, 48, 48, 48)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 8),
                      child: Text(
                        "Description :",
                        style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 48, 48, 48)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 8),
                      child: Text(
                        widget.des,
                        style: GoogleFonts.inter(
                            fontSize: 13,
                            // fontWeight: FontWeight.w700,
                            color: const Color.fromARGB(255, 58, 58, 58)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 8),
                      child: Row(
                        children: [
                          Text(
                            "Eligible class : ",
                            style: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromARGB(255, 48, 48, 48)),
                          ),
                          Text(
                            widget.eligibleClass,
                            style: GoogleFonts.inter(
                                fontSize: 13,
                                // fontWeight: FontWeight.w600,
                                color: const Color.fromARGB(255, 63, 63, 63)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 8),
                      child: Row(
                        children: [
                          Text(
                            "Time : ",
                            style: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromARGB(255, 48, 48, 48)),
                          ),
                          Text(
                            "11:00 AM- 2:00PM",
                            style: GoogleFonts.inter(
                                fontSize: 13,
                                // fontWeight: FontWeight.w600,
                                color: const Color.fromARGB(255, 63, 63, 63)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 8),
                      child: Row(
                        children: [
                          Text(
                            "Date : ",
                            style: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromARGB(255, 48, 48, 48)),
                          ),
                          Text(
                            widget.date,
                            style: GoogleFonts.inter(
                                fontSize: 13,
                                // fontWeight: FontWeight.w600,
                                color: const Color.fromARGB(255, 63, 63, 63)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 8),
                      child: Text(
                        "Event Pictures :",
                        style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 48, 48, 48)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8, top: 8, bottom: 4),
                      child: Container(
                        height: 90,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: Container(
                                height: 70,
                                width: 90,
                                child: Image.network(
                                  widget.eventPics[i],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                          itemCount: widget.eventPics.length,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, left: 8),
                      child: Text(
                        "Remark :",
                        style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 48, 48, 48)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 8),
                      child: Text(
                        widget.remark,
                        style: GoogleFonts.inter(
                            fontSize: 13,
                            // fontWeight: FontWeight.w700,
                            color: const Color.fromARGB(255, 58, 58, 58)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}

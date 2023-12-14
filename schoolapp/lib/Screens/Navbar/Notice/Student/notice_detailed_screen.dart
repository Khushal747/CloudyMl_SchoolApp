import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../constants/style.dart';
import '../../../../widget/appBar/appbar_widget.dart';
import '../../../../widget/appBar/decorative_apbar_widget.dart';
import 'package:intl/intl.dart';

class NoticeDetailedScreen extends StatefulWidget {
  final String imglink;
  final String des;
  final String date;
  final String heading;
  const NoticeDetailedScreen({
    super.key,
    required this.imglink,
    required this.des,
    required this.date,
    required this.heading,
  });

  @override
  State<NoticeDetailedScreen> createState() => _NoticeDetailedScreenState();
}

class _NoticeDetailedScreenState extends State<NoticeDetailedScreen> {
  String formatDate(String dateString) {
    final inputFormat = DateFormat('yyyy-MM-dd');
    final outputFormat = DateFormat('dd-MM-yyyy');

    final date = inputFormat.parse(dateString);
    return outputFormat.format(date);
  }

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
              extra: appbar("assets/add_events.png", " Notice", context, () {
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
                            formatDate(widget.date),
                            style: GoogleFonts.inter(
                                fontSize: 13,
                                // fontWeight: FontWeight.w600,
                                color: const Color.fromARGB(255, 63, 63, 63)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, left: 8),
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

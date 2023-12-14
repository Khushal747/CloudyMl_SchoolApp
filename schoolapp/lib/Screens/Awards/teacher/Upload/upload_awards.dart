import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:school_management_system/Screens/Dashboard.dart';
import 'package:school_management_system/Services/api_services.dart';
import 'package:school_management_system/widget/Button/my_elevatedbutton.dart';
import '../../../../constants/style.dart';
import '../../../../widget/Button/rectangle_elevatedbutton_card.dart';
import '../../../../widget/appBar/appbar_widget.dart';
import '../../../../widget/appBar/decorative_apbar_widget.dart';

class UploadAwards extends StatefulWidget {
  const UploadAwards({super.key});

  @override
  State<UploadAwards> createState() => _UploadAwardsState();
}

class _UploadAwardsState extends State<UploadAwards> {
  TextEditingController studentName = TextEditingController();
  TextEditingController wclass = TextEditingController();
  TextEditingController section = TextEditingController();
  TextEditingController heading = TextEditingController();
  TextEditingController dateInput = TextEditingController();
  TextEditingController rollNumber = TextEditingController();

  File? file; // Store selected file
  bool dataMatches = false;
  Future<void> getGal() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
    );

    if (result != null && result.files.isNotEmpty) {
      File selectedFile = File(result.files.single.path!);

      setState(() {
        file = selectedFile;
      });
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showUnsuccessfulSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> _showAlertDialog(
      BuildContext context, String title, String content) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor:
              Colors.white, // Change this line to set the background color
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'OK',
                style: TextStyle(color: Buttonc, fontWeight: FontWeight.w500),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(300),
        child: DecorativeAppBar(
          barHeight: MediaQuery.of(context).size.height * 0.25,
          barPad: MediaQuery.of(context).size.height * 0.19,
          radii: 30,
          background: Colors.white,
          gradient1: lightBlue,
          gradient2: deepBlue,
          extra: appbar("assets/awards_trophy.png", " Awards", context, () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const Dashboard()));
          }),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20,
              ),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Student Name*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller: studentName,
                      decoration: InputDecoration(
                        hintText: "Enter student name",
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 12,
                          color: const Color.fromARGB(255, 135, 135, 135),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 30),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Which Class*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller: wclass, // Fixed the controller name here
                      decoration: InputDecoration(
                        hintText: "Enter class",
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 12,
                          color: const Color.fromARGB(255, 135, 135, 135),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 30),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Which Section*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller: section, // Fixed the controller name here
                      decoration: InputDecoration(
                        hintText: "Enter section",
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 12,
                          color: const Color.fromARGB(255, 135, 135, 135),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 30),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Student Roll",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller: rollNumber,
                      decoration: InputDecoration(
                        hintText: "Enter roll number",
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 12,
                          color: const Color.fromARGB(255, 135, 135, 135),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 30),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Certification Heading*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller: heading,
                      decoration: InputDecoration(
                        hintText: "Enter Certification heading",
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 12,
                          color: const Color.fromARGB(255, 135, 135, 135),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 30),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Date of Certification received*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller: dateInput,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.calendar_month,
                        ),
                        hintText: "Select date",
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 12,
                          color: const Color.fromARGB(255, 135, 135, 135),
                        ),
                      ),
                      onTap: () async {
                        final DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );

                        if (pickedDate != null) {
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          setState(() {
                            dateInput.text = formattedDate;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 30),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Add Certificate*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    if (file != null)
                      SizedBox(
                        height: 200,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.file(
                            file!,
                            width: 150,
                            height: 130,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: MyElevatedButton(
                            onPressed: () {
                              getGal();
                            },
                            child: const Text(
                              "Upload",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      persistentFooterButtons: [
        RecElevatedButton(
          onPressed: () {
            if (studentName.text.isEmpty ||
                wclass.text.isEmpty ||
                section.text.isEmpty ||
                rollNumber.text.isEmpty ||
                heading.text.isEmpty ||
                dateInput.text.isEmpty ||
                file == null) {
              _showAlertDialog(
                context,
                'Error',
                'Please fill in all fields.',
              );
            } else {
              ApiServices.teacherUploadAwards(
                studentName.text,
                wclass.text,
                section.text,
                rollNumber.text,
                heading.text,
                dateInput.text,
                file!,
                context,
              ).then((value) {
                if (value == true) {
                  _showSnackBar(context, "Event Uploaded Successfully");
                  Navigator.pop(context);
                } else {
                  _showUnsuccessfulSnackBar(
                      context, "Student Data does not match.");
                }
              });
            }
          },
          child: const Text(
            "SUBMIT",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

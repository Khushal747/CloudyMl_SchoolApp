import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_management_system/Services/api_services.dart';
import '../../../../constants/style.dart';
import '../../../../widget/Button/rectangle_elevatedbutton_card.dart';
import '../../../../widget/appBar/appbar_widget.dart';
import '../../../../widget/appBar/decorative_apbar_widget.dart';

class UploadAboutSchool extends StatefulWidget {
  const UploadAboutSchool({super.key});

  @override
  State<UploadAboutSchool> createState() => _UploadAwardsState();
}

class _UploadAwardsState extends State<UploadAboutSchool> {
  TextEditingController schoolAddress = TextEditingController();
  TextEditingController schoolWebsite = TextEditingController();
  TextEditingController schoolEmail = TextEditingController();
  TextEditingController aboutSchool = TextEditingController();
  TextEditingController coreValues = TextEditingController();
  // Phone Number
  TextEditingController principalPhone = TextEditingController();
  TextEditingController admissionDeptPhone = TextEditingController();
  TextEditingController enquiryOfficePhone = TextEditingController();

  File? file; // Store selected file
  File? profilePic;
  File? coverPic;
  bool dataMatches = false;

  Future<void> getGal() async {
    FilePickerResult? rules = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
    );

    if (rules != null && rules.files.isNotEmpty) {
      File selectedFile = File(rules.files.single.path!);

      setState(() {
        file = selectedFile;
      });
    }
  }

  Future<void> getProfilePicture() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );

    if (result != null && result.files.isNotEmpty) {
      File selectedFile = File(result.files.single.path!);

      setState(() {
        profilePic = selectedFile;
      });
    }
  }

  Future<void> getCoverPicture() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );

    if (result != null && result.files.isNotEmpty) {
      File selectedFile = File(result.files.single.path!);

      setState(() {
        coverPic = selectedFile;
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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(300),
        child: DecorativeAppBar(
          barHeight: MediaQuery.of(context).size.height * 0.24,
          barPad: MediaQuery.of(context).size.height * 0.20,
          radii: 30,
          background: Colors.white,
          gradient1: lightBlue,
          gradient2: deepBlue,
          extra: appbar(
              "assets/flaticon/about_school.png", "About School", context, () {
            Navigator.pop(context);
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
                      "School Address*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller:
                          schoolAddress, // Fixed the controller name here
                      decoration: InputDecoration(
                        hintText: "Enter school address",
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
                      "School Website*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller:
                          schoolWebsite, // Fixed the controller name here
                      decoration: InputDecoration(
                        hintText: "Enter school Website",
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
                      "School Email*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller: schoolEmail,
                      decoration: InputDecoration(
                        hintText: "Enter school Email",
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
                      "About School",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller: aboutSchool,
                      decoration: InputDecoration(
                        hintText: "Enter about school",
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
                      "Core Values*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller: coreValues, // Fixed the controller name here
                      decoration: InputDecoration(
                        hintText: "Enter school core values",
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
                      "Principal Office Phone*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller: principalPhone,
                      decoration: InputDecoration(
                        hintText: "Enter princial office phone number",
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
                      "Admission Department Phone*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller: admissionDeptPhone,
                      decoration: InputDecoration(
                        hintText: "Enter Admission Department Phone number",
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
                      "Enquiry Office Phone*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller: enquiryOfficePhone,
                      decoration: InputDecoration(
                        hintText: "Enter Enquiry Office Phone number",
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
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Upload Rules & Regulations*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    if (file != null)
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: file!.path.toLowerCase().endsWith('.pdf')
                              ? PDFView(
                                  filePath: file?.path ?? '',
                                )
                              : Image.file(
                                  file!,
                                  fit: BoxFit.fill,
                                ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: InkWell(
                        onTap: () {
                          getGal();
                        },
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.14,
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.08,
                                  width:
                                      MediaQuery.of(context).size.width * 0.12,
                                  child: Image.asset("assets/upload.png"),
                                ),
                                Text(
                                  "Upload",
                                  style: GoogleFonts.inter(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ),
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
                      "Upload School Profile Picture*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    if (profilePic != null)
                      SizedBox(
                        height: 200,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.file(
                            profilePic!,
                            // width: MediaQuery.of(context).size.width * 0.8,
                            // height: MediaQuery.of(context).size.height * 0.4,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: InkWell(
                        onTap: () {
                          getProfilePicture();
                        },
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.14,
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.08,
                                  width:
                                      MediaQuery.of(context).size.width * 0.12,
                                  child: Image.asset("assets/upload.png"),
                                ),
                                Text(
                                  "Upload",
                                  style: GoogleFonts.inter(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ),
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
                      "Upload School Cover Picture*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    if (coverPic != null)
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.26,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.file(
                            coverPic!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: InkWell(
                        onTap: () {
                          getCoverPicture();
                        },
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.14,
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.08,
                                  width:
                                      MediaQuery.of(context).size.width * 0.12,
                                  child: Image.asset("assets/upload.png"),
                                ),
                                Text(
                                  "Upload",
                                  style: GoogleFonts.inter(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        RecElevatedButton(
          onPressed: () {
            if (schoolAddress.text.isEmpty ||
                coreValues.text.isEmpty ||
                schoolWebsite.text.isEmpty ||
                aboutSchool.text.isEmpty ||
                schoolEmail.text.isEmpty ||
                principalPhone.text.isEmpty ||
                enquiryOfficePhone.text.isEmpty ||
                admissionDeptPhone.text.isEmpty ||
                coverPic == null ||
                profilePic == null ||
                file == null) {
              _showAlertDialog(
                context,
                'Error',
                'Please fill in all fields.',
              );
            } else {
              ApiServices.teacherUploadAboutUs(
                schoolAddress.text,
                schoolWebsite.text,
                aboutSchool.text,
                schoolEmail.text,
                coreValues.text,
                principalPhone.text,
                admissionDeptPhone.text,
                enquiryOfficePhone.text,
                file!,
                profilePic!,
                coverPic!,
                context,
              ).then((value) {
                if (value == true) {
                  _showSnackBar(context, "About School Uploaded Successfully");
                  Navigator.pop(context);
                } else {
                  _showUnsuccessfulSnackBar(context, "Invalid");
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

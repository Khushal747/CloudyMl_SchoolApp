import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:intl/intl.dart';
import 'package:school_management_system/Screens/Assignment/Student/assignment_start_page.dart';
import 'package:school_management_system/Services/api_services.dart';
import 'package:school_management_system/constants/style.dart';
import 'package:school_management_system/widget/Button/my_elevatedbutton.dart';
import 'package:school_management_system/widget/Button/rectangle_elevatedbutton_card.dart';
import 'package:school_management_system/widget/appBar/appbar_widget.dart';
import '../../../Services/shared_services.dart';
import '../../../widget/appBar/decorative_apbar_widget.dart';

class StudentSubmitAssignment extends StatefulWidget {
  final String submitAssignmentID;

  const StudentSubmitAssignment({
    super.key,
    required this.submitAssignmentID,
  });

  @override
  State<StudentSubmitAssignment> createState() =>
      _StudentSubmitAssignmentState();
}

class _StudentSubmitAssignmentState extends State<StudentSubmitAssignment> {
  TextEditingController dateInput = TextEditingController();
  TextEditingController wclass = TextEditingController();
  TextEditingController subject = TextEditingController();
  TextEditingController headline = TextEditingController();
  TextEditingController comments = TextEditingController();
  TextEditingController section = TextEditingController();

  File? file;
  ImagePicker image = ImagePicker();

  void showSuccessSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Assignment uploaded successfully'),
        duration: Duration(seconds: 3),
      ),
    );
  }

  void showFalureSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.red,
        content: Text('Assignment already uploaded'),
        duration: Duration(seconds: 3),
      ),
    );
  }

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
          extra: appbar(
              "assets/flaticon/_assignments.png", " Assignments", context, () {
            Navigator.pop(context);
          }),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Submit Date*",
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
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2100),
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
              padding: EdgeInsets.only(
                  left: width * 0.05, right: width * 0.05, top: width * 0.05),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Enter Standard*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller: wclass,
                      decoration: InputDecoration(
                        hintText: "Enter your class",
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
              padding: EdgeInsets.only(
                  left: width * 0.05, right: width * 0.05, top: width * 0.05),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Enter Section*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller: section,
                      decoration: InputDecoration(
                        hintText: "Enter your section",
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
              padding: EdgeInsets.only(
                  left: width * 0.05, right: width * 0.05, top: width * 0.05),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Enter Subject*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller: subject,
                      decoration: InputDecoration(
                        hintText: "Enter subject of assignment",
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
              padding: EdgeInsets.only(
                  left: width * 0.05, right: width * 0.05, top: width * 0.05),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Enter Headline*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller: headline,
                      decoration: InputDecoration(
                        hintText: "Enter headline of assignment",
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
              padding: EdgeInsets.only(
                  left: width * 0.05, right: width * 0.05, top: width * 0.05),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Enter Comments",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller: comments,
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: "Enter any comments",
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
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                height: height * 0.2,
                width: width * 0.6,
                color: Colors.black12,
                child: file == null
                    ? const Icon(
                        Icons.image,
                        size: 50,
                      )
                    : file!.path.toLowerCase().endsWith('.pdf')
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
              padding: EdgeInsets.only(
                  left: width * 0.18, right: width * 0.18, top: height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyElevatedButton(
                    onPressed: () {
                      getGal();
                    },
                    width: width * 0.3,
                    child: const Text(
                      "Chose file",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  MyElevatedButton(
                    onPressed: () {
                      getCam();
                    },
                    width: width * 0.3,
                    child: const Text(
                      "Camera",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
      persistentFooterButtons: [
        RecElevatedButton(
          onPressed: () {
            ApiServices.StudentUploadAssignment(
                    wclass.text,
                    section.text,
                    subject.text,
                    dateInput.text,
                    SharedService.loginDetails()!
                        .data!
                        .data!
                        .rollNumber
                        .toString(),
                    file!,
                    widget.submitAssignmentID.toString(),
                    context)
                .then((value) {
              if (value == true) {
                showSuccessSnackbar();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const StudentAssignmentChoose()));
              } else {
                showFalureSnackbar();
              }
            });
          },
          child: const Text(
            "Submit",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ],
    );
  }

  getCam() async {
    var img = await image.pickImage(source: ImageSource.camera);
    setState(() {
      file = File(img!.path);
    });
  }

  getGallery() async {
    var img = await image.pickImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });
  }

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
}

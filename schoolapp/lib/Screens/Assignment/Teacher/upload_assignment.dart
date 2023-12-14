import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:intl/intl.dart';
import 'package:school_management_system/Services/api_services.dart';
import 'package:school_management_system/constants/style.dart';
import 'package:school_management_system/widget/Button/my_elevatedbutton.dart';
import 'package:school_management_system/widget/Button/rectangle_elevatedbutton_card.dart';
import 'package:school_management_system/widget/appBar/appbar_widget.dart';
import 'package:school_management_system/widget/appBar/decorative_apbar_widget.dart';

class UploadAssignment extends StatefulWidget {
  const UploadAssignment({super.key});

  @override
  State<UploadAssignment> createState() => _UploadAssignmentState();
}

class _UploadAssignmentState extends State<UploadAssignment> {
  TextEditingController dateInput = TextEditingController();
  TextEditingController lastDateInput = TextEditingController();
  TextEditingController classInput = TextEditingController();
  TextEditingController subjectInput = TextEditingController();
  TextEditingController headlineInput = TextEditingController();
  TextEditingController commentsInput = TextEditingController();
  TextEditingController sectionInput = TextEditingController();
  TextEditingController topicInput = TextEditingController();

  File? file;
  ImagePicker image = ImagePicker();

  bool canSubmit() {
    return classInput.text.isNotEmpty &&
        sectionInput.text.isNotEmpty &&
        subjectInput.text.isNotEmpty &&
        topicInput.text.isNotEmpty &&
        file != null &&
        dateInput.text.isNotEmpty &&
        lastDateInput.text.isNotEmpty;
  }

  void showSuccessSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Assignment uploaded successfully'),
        duration: Duration(seconds: 3),
      ),
    );
  }

  void showFailureSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.red,
        content: Text("Try again..."),
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
        preferredSize: const Size.fromHeight(300),
        child: DecorativeAppBar(
          barHeight: MediaQuery.of(context).size.height * 0.24,
          barPad: MediaQuery.of(context).size.height * 0.19,
          radii: 30,
          background: Colors.white,
          gradient1: lightBlue,
          gradient2: deepBlue,
          extra: appbar(
              "assets/flaticon/_assignments.png", "Assignments", context, () {
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
                      "Given Date*",
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
                      "Last Date of Submit*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller: lastDateInput,
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
                            lastDateInput.text = formattedDate;
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
                      controller: classInput,
                      decoration: InputDecoration(
                        hintText: "Enter class for assignment",
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
                      controller: sectionInput,
                      decoration: InputDecoration(
                        hintText: "Enter section for assignment",
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
                      controller: subjectInput,
                      decoration: InputDecoration(
                        hintText: "Enter subject for assignment",
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
                      "Enter Topic*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller: topicInput,
                      decoration: InputDecoration(
                        hintText: "Enter topic of the subject",
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
            SizedBox(
              height: width * 0.06,
            ),
            Center(
              // Center added here
              child: Container(
                height: height * 0.2,
                width: width * 0.52,
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
            SizedBox(
              height: width * 0.05,
            ),
            Center(
              // Center added here
              child: MyElevatedButton(
                onPressed: () {
                  getGal();
                },
                child: const Text(
                  "+ Choose file",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: width * 0.15,
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        RecElevatedButton(
          onPressed: canSubmit()
              ? () {
                  print("Button Pressed");

                  ApiServices.TeacherAddAssignment(
                          dateInput.text,
                          lastDateInput.text,
                          classInput.text,
                          sectionInput.text,
                          subjectInput.text,
                          topicInput.text,
                          file!,
                          context)
                      .then((value) {
                    if (value == true) {
                      showSuccessSnackbar();
                      Navigator.pop(context);
                    }
                  });
                }
              : () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Error'),
                        content: const Text(
                            'Please fill in all fields and choose a file.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
          child: const Text(
            "SUBMIT",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ],
    );
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

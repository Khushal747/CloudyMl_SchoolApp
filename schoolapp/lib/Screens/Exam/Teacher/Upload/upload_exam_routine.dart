import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_management_system/Services/api_services.dart';
import '../../../../../constants/style.dart';
import '../../../../../widget/Button/my_elevatedbutton.dart';
import '../../../../../widget/Button/rectangle_elevatedbutton_card.dart';
import '../../../../../widget/appBar/appbar_widget.dart';
import '../../../../../widget/appBar/decorative_apbar_widget.dart';
import '../../../../Services/shared_services.dart';

class UploadExamRoutine extends StatefulWidget {
  final String selectedClass;
  final String remarks;
  final String testType;
  const UploadExamRoutine({
    Key? key,
    required this.selectedClass,
    required this.remarks,
    required this.testType,
  });
  @override
  _UploadResultState createState() => _UploadResultState();
}

class _UploadResultState extends State<UploadExamRoutine> {
  List<ExamRoutineData> examData = [];
  TextEditingController subjectController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  bool isEditing = false;
  ExamRoutineData? selectPaper;

  void deletePeriod(int index) {
    setState(() {
      examData.removeAt(index);
      clearTextFields();
    });
  }

  void updatePeriod() {
    setState(() {
      if (selectPaper != null) {
        selectPaper?.subject = subjectController.text;
        selectPaper?.date = dateController.text;
        selectPaper?.time = timeController.text;

        isEditing = false;
        clearTextFields();
      }
    });
  }

  void clearTextFields() {
    setState(() {
      subjectController.clear();
      dateController.clear();
      timeController.clear();

      selectPaper = null;
      isEditing = false;
    });
  }

  void showSuccessSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Exam uploaded successfully'),
        duration: Duration(seconds: 3),
      ),
    );
  }

  void showFailureSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Exam Routine already added for this class'),
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
          barHeight: MediaQuery.of(context).size.height * 0.20,
          barPad: MediaQuery.of(context).size.height * 0.17,
          radii: 30,
          background: Colors.white,
          gradient1: lightBlue,
          gradient2: deepBlue,
          extra:
              appbar("assets/flaticon/_exam.png", "Exam Routine", context, () {
            Navigator.pop(context);
          }),
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: width * 0.078,
                    right: width * 0.07,
                  ),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Subject*",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color: const Color.fromARGB(255, 96, 96, 96),
                          ),
                        ),
                        TextField(
                          controller: subjectController,
                          decoration: InputDecoration(
                            hintText: "Enter the subject ",
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
                      left: width * 0.078,
                      right: width * 0.07,
                      top: width * 0.02),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Date*",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color: const Color.fromARGB(255, 96, 96, 96),
                          ),
                        ),
                        TextField(
                          controller: dateController,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2101),
                            );

                            if (pickedDate != null &&
                                pickedDate != DateTime.now()) {
                              setState(() {
                                dateController.text =
                                    "${pickedDate.month}/${pickedDate.day}/${pickedDate.year}";
                              });
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Select exam date ",
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
                      left: width * 0.078,
                      right: width * 0.07,
                      top: width * 0.02),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Time*",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color: const Color.fromARGB(255, 96, 96, 96),
                          ),
                        ),
                        TextField(
                          controller: timeController,
                          onTap: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );

                            if (pickedTime != null) {
                              setState(() {
                                timeController.text =
                                    pickedTime.format(context);
                              });
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Select exam time ",
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
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                MyElevatedButton(
                  onPressed: () {
                    if (isEditing) {
                      updatePeriod();
                    } else {
                      examData.add(ExamRoutineData(
                        subject: subjectController.text,
                        date: dateController.text,
                        time: timeController.text,
                      ));
                    }
                    clearTextFields();
                  },
                  child: Text(
                    isEditing ? "Update" : "Add",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Expanded(
            child: ListView(
              children: examData.map((periodData) {
                return Card(
                  child: ListTile(
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: deepBlue,
                        ),
                        borderRadius: BorderRadius.circular(12)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Subject: ${periodData.subject}"),
                        Text("Date: ${periodData.date}"),
                        Text("Time: ${periodData.time}"),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            setState(() {
                              subjectController.text = periodData.subject;
                              dateController.text = periodData.date;
                              timeController.text = periodData.time;
                              selectPaper = periodData;
                              isEditing = true;
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            deletePeriod(examData.indexOf(periodData));
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      persistentFooterButtons: [
        RecElevatedButton(
          onPressed: () {
            Map<String, dynamic> postData = {
              "schoolName":
                  SharedService.loginDetails()!.data!.data!.school.toString(),
              "class": widget.selectedClass,
              "examType": widget.testType,
              "remarks": widget.remarks,
              "examDetails": examData.map((subjects) {
                return {
                  "date": subjects.date,
                  "subject": subjects.subject,
                  "time": subjects.time,
                };
              }).toList(),
            };

            log(postData.toString());
            ApiServices.uploadExamRoutine(postData).then((value) {
              if (value == true) {
                showSuccessSnackbar();
                Navigator.pop(context);
              } else {
                showFailureSnackbar();
              }
            });
          },
          child: const Text(
            "SUBMIT",
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
        )
      ],
    );
  }
}

class ExamRoutineData {
  String subject;
  String date;
  String time;

  ExamRoutineData({
    required this.subject,
    required this.date,
    required this.time,
  });
}

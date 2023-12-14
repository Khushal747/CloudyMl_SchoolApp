import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:school_management_system/Services/api_services.dart';
import '../../../../constants/style.dart';
import '../../../../widget/Button/my_elevatedbutton.dart';
import '../../../../widget/Button/rectangle_elevatedbutton_card.dart';
import '../../../../widget/appBar/appbar_widget.dart';
import '../../../../widget/appBar/decorative_apbar_widget.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  TextEditingController heading = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController des = TextEditingController();
  TextEditingController elegibleClass = TextEditingController();
  TextEditingController remark = TextEditingController();
  String? selectedStatus;
  List<XFile> selectedImages = []; // Store selected images
  File? file;
  ImagePicker image = ImagePicker();

  Future<void> pickImages() async {
    final List<XFile>? images = await ImagePicker().pickMultiImage();
    if (images != null && images.isNotEmpty) {
      setState(() {
        selectedImages = images;
      });
    }
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert"),
          content: Text("Please fill in all the required fields."),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the alert dialog
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> pickDate() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (selectedDate != null && selectedDate != date) {
      setState(() {
        date.text = selectedDate.toLocal().toString().split(' ')[0];
      });
    }
  }

  Future<void> pickTime() async {
    final selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (selectedTime != null) {
      final formattedTime = selectedTime.format(context);
      setState(() {
        time.text = formattedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DecorativeAppBar(
              barHeight: MediaQuery.of(context).size.height * 0.24,
              barPad: MediaQuery.of(context).size.height * 0.19,
              radii: 30,
              background: Colors.white,
              gradient1: lightBlue,
              gradient2: deepBlue,
              extra: appbar("assets/add_events.png", "Add Events", context, () {
                Navigator.of(context).pop();
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Event Heading*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller: heading,
                      decoration: InputDecoration(
                        hintText: "Enter event heading",
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
            GestureDetector(
              onTap: pickDate,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 30),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Date of Event*",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: const Color.fromARGB(255, 96, 96, 96),
                        ),
                      ),
                      TextField(
                        controller: date,
                        enabled: false, // Disable manual text input
                        decoration: InputDecoration(
                          hintText: "Tap to select date",
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 12,
                            color: const Color.fromARGB(255, 135, 135, 135),
                          ),
                          suffixIcon: IconButton(
                            onPressed: pickDate,
                            icon: const Icon(
                              Icons.calendar_today,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: pickTime,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 30),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Timing of Event*",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: const Color.fromARGB(255, 96, 96, 96),
                        ),
                      ),
                      TextField(
                        controller: time,
                        enabled: false, // Disable manual text input
                        decoration: InputDecoration(
                          hintText: "Tap to select time",
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 12,
                            color: const Color.fromARGB(255, 135, 135, 135),
                          ),
                          suffixIcon: IconButton(
                            onPressed: pickTime,
                            icon: const Icon(
                              Icons.access_time,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                      "Description of Event*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller: des,
                      decoration: InputDecoration(
                        hintText: "Enter about the event",
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
                      "Elegible Class*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller: elegibleClass,
                      decoration: InputDecoration(
                        hintText: " Example 5 to 10",
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
                      "Remark",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller: remark,
                      decoration: InputDecoration(
                        hintText: "Enter remark",
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
                      "Status of the Event*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DropdownButton<String>(
                      isExpanded: true,
                      hint: const Text("Select from dropdown"),
                      value: selectedStatus,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedStatus = newValue;
                        });
                      },
                      items: <String>['Completed', 'Pending']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
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
                    if (selectedImages.isNotEmpty)
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: selectedImages.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.file(
                                File(selectedImages[index].path),
                                // width: 150,
                                // height: 130,
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, top: 20, right: 20, bottom: 20),
              child: MyElevatedButton(
                onPressed: () {
                  pickImages();
                },
                child: Text(
                  "Add Photos",
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        Align(
          alignment: Alignment.bottomLeft,
          child: RecElevatedButton(
            onPressed: () {
             try{
               if (heading.text.isEmpty ||
                  date.text.isEmpty ||
                  time.text.isEmpty ||
                  des.text.isEmpty ||
                  elegibleClass.text.isEmpty ||
                  selectedStatus == null ||
                  selectedImages.isEmpty) {
                showAlertDialog(context);
              } else {
                ApiServices.teacherUploadEvents(
                        heading.text,
                        des.text,
                        date.text,
                        time.text,
                        selectedStatus.toString(),
                        elegibleClass.text,
                        remark.text,
                        selectedImages)
                    .then((value) {
                  if (value == true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Event Uploaded Successfully"),
                        duration: Duration(seconds: 2), // Adjust as needed
                      ),
                    );
                    Navigator.pop(context);
                  }
                });
              }
             }catch(e){
              EasyLoading.showError(e.toString());
             }
            },
            child: const Text(
              "UPLOAD",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
        ),
      ],
    );
  }
}

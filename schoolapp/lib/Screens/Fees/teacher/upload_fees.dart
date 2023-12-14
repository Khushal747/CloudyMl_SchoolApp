import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_management_system/Services/api_services.dart';
import 'package:school_management_system/constants/style.dart';
import 'package:school_management_system/widget/Button/rectangle_elevatedbutton_card.dart';
import 'package:school_management_system/widget/appBar/appbar_widget.dart';
import 'package:school_management_system/widget/appBar/decorative_apbar_widget.dart';

import '../../../Models/Student/Fees/student_fee_response_model.dart';
import '../../Dashboard.dart';

class UploadFees extends StatefulWidget {
  final SingleFeeModel? feesModel;
  const UploadFees({super.key, this.feesModel});

  @override
  State<UploadFees> createState() => _UploadFeesState();
}

class _UploadFeesState extends State<UploadFees> {
  TextEditingController classInput = TextEditingController();
  TextEditingController admissionInput = TextEditingController();
  TextEditingController miscellaneousInput = TextEditingController();
  TextEditingController libraryInput = TextEditingController();
  TextEditingController tuitionInput = TextEditingController();
  TextEditingController examInput = TextEditingController();
  TextEditingController transportInput = TextEditingController();

  @override
  void initState() {
    if (widget.feesModel != null) {
      classInput.text = widget.feesModel!.datumClass!.toString();
      admissionInput.text = widget.feesModel!.admissionFees!.toString();
      libraryInput.text = widget.feesModel!.libraryFees!.toString();
      tuitionInput.text = widget.feesModel!.tuitionFees!.toString();
      examInput.text = widget.feesModel!.examinationFees!.toString();
      transportInput.text = widget.feesModel!.transportFees!.toString();
      miscellaneousInput.text = widget.feesModel!.miscellaneousFees!.toString();
    }
    super.initState();
  }

  void showSuccessSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Fee details uploaded successfully'),
        duration: Duration(seconds: 3),
      ),
    );
  }

  void showFailureSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Class can not be edited'),
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
              "assets/flaticon/_fees.png",
              widget.feesModel != null ? "Update fees" : "Upload Fees",
              context, () {
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
                      "Standard*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller: classInput,
                      decoration: InputDecoration(
                        hintText: "Enter Class",
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
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Admission Fees*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller: admissionInput,
                      decoration: InputDecoration(
                        hintText: "Enter admission fees",
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
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Examination Fees*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller: examInput,
                      decoration: InputDecoration(
                        hintText: "Enter examination fees",
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
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tuition Fees*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller: tuitionInput,
                      decoration: InputDecoration(
                        hintText: "Enter tuition fees",
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
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Library Fees*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller: libraryInput,
                      decoration: InputDecoration(
                        hintText: "Enter library fees",
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
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Transport Fees*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller: transportInput,
                      decoration: InputDecoration(
                        hintText: "Enter transport fees",
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
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Miscellaneous Fees*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller: miscellaneousInput,
                      decoration: InputDecoration(
                        hintText: "Enter miscellaneous fees",
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
          ],
        ),
      ),
      persistentFooterButtons: [
        RecElevatedButton(
          onPressed: () {
            widget.feesModel != null
                ? ApiServices.updateFees(
                        classInput.text,
                        admissionInput.text,
                        tuitionInput.text,
                        examInput.text,
                        libraryInput.text,
                        transportInput.text,
                        miscellaneousInput.text)
                    .then((value) {
                    if (value == true) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Dashboard()));
                      showSuccessSnackbar();
                    } else {
                      showFailureSnackbar();
                    }
                  })
                : ApiServices.uploadFees(
                        classInput.text,
                        admissionInput.text,
                        tuitionInput.text,
                        examInput.text,
                        libraryInput.text,
                        transportInput.text,
                        miscellaneousInput.text)
                    .then((value) {
                    if (value == true) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Dashboard()));
                      showSuccessSnackbar();
                    } else {
                      showFailureSnackbar();
                    }
                  });
          },
          child: Text(
            widget.feesModel != null ? "UPDATE " : "SUBMIT",
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

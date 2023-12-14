import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Services/api_services.dart';
import '../../../Services/shared_services.dart';
import '../../../constants/style.dart';
import '../../../widget/Button/my_elevatedbutton.dart';
import '../../../widget/appBar/appbar_widget.dart';
import '../../../widget/appBar/decorative_apbar_widget.dart';
import '../../Dashboard.dart';

class StudentRegisterEvents extends StatefulWidget {
  String eventID;
  String eventHeading;
  StudentRegisterEvents(
      {super.key, required this.eventID, required this.eventHeading});

  @override
  State<StudentRegisterEvents> createState() => _EditMyAccountDetailsState();
}

class _EditMyAccountDetailsState extends State<StudentRegisterEvents> {
  TextEditingController nameInput = TextEditingController();
  TextEditingController classInput = TextEditingController();
  TextEditingController sectionInput = TextEditingController();
  TextEditingController rollnumbeInput = TextEditingController();
  TextEditingController emailInput = TextEditingController();
  TextEditingController phonenoInput = TextEditingController();
  TextEditingController eventNameInput = TextEditingController();
  TextEditingController genderInput = TextEditingController();

  @override
  void initState() {
    nameInput.text = SharedService.loginDetails()!.data!.data!.name.toString();
    emailInput.text =
        SharedService.loginDetails()!.data!.data!.email.toString();
    super.initState();
    phonenoInput.text =
        SharedService.loginDetails()!.data!.data!.phoneNumber.toString();
    super.initState();
    sectionInput.text =
        SharedService.loginDetails()!.data!.data!.section.toString();
    super.initState();
    rollnumbeInput.text =
        SharedService.loginDetails()!.data!.data!.rollNumber.toString();
    super.initState();
    classInput.text =
        SharedService.loginDetails()!.data!.data!.dataClass.toString();
    super.initState();
    genderInput.text =
        SharedService.loginDetails()!.data!.data!.gender.toString();
    super.initState();
    eventNameInput.text = widget.eventHeading;
  }

  @override
  Widget build(BuildContext context) {
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
          extra: appbar("assets/register_events.png", " Resister", context, () {
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
                      "Event Name*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller: eventNameInput,
                      decoration: InputDecoration(
                        hintText: "Enter event name",
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
                      "Student Name*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller: nameInput, // Fixed the controller name here
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
                      "Class*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller: classInput, // Fixed the controller name here
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
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 30),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Section*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller:
                          sectionInput, // Fixed the controller name here
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
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 30),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Roll Number*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller:
                          rollnumbeInput, // Fixed the controller name here
                      decoration: InputDecoration(
                        hintText: "Enter your roll number",
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
                      "Phone Number*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller:
                          phonenoInput, // Fixed the controller name here
                      decoration: InputDecoration(
                        hintText: "Enter phone",
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
                      "Email*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller: emailInput,
                      decoration: InputDecoration(
                        hintText: "Enter your email",
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
                      "Gender*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller: genderInput,
                      decoration: InputDecoration(
                        hintText: "Enter gender",
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
              padding: const EdgeInsets.only(top: 50, left: 20),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: MyElevatedButton(
                  onPressed: () {
                    print("Event ID =${widget.eventID}");
                    ApiServices.studentRegisterEvent(
                      nameInput.text,
                      classInput.text,
                      sectionInput.text,
                      rollnumbeInput.text,
                      emailInput.text,
                      phonenoInput.text,
                      eventNameInput.text,
                      genderInput.text,
                      widget.eventID,
                    ).then((value) {
                      if (value == true) {
                        // Successful API call
                        final controller =
                            ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Registration successful"),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        controller.closed.then((reason) {
                          if (reason == SnackBarClosedReason.timeout) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Dashboard()),
                            );
                          }
                        });
                      } else {
                        // Unsuccessful API call
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                "Registration failed. Please try again later."),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    });
                  },
                  child: const Text(
                    "SUBMIT",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

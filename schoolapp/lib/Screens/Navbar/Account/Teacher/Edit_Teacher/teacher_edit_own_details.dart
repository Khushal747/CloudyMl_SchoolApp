import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_management_system/Screens/Login/role_choose_screen.dart';
import 'package:school_management_system/Services/api_services.dart';
import 'package:school_management_system/Services/shared_services.dart';

import '../../../../../constants/style.dart';
import '../../../../../widget/Button/my_elevatedbutton.dart';
import '../../../../../widget/appBar/appbar_widget.dart';
import '../../../../../widget/appBar/decorative_apbar_widget.dart';

class EditTeacherAccountDetails extends StatefulWidget {
  const EditTeacherAccountDetails({super.key, l});

  @override
  State<EditTeacherAccountDetails> createState() =>
      _EditTeacherAccountDetailsState();
}

class _EditTeacherAccountDetailsState extends State<EditTeacherAccountDetails> {
  TextEditingController nameInput = TextEditingController();
  TextEditingController emailInput = TextEditingController();
  TextEditingController phonenoInput = TextEditingController();
  TextEditingController passwordInput = TextEditingController();
  TextEditingController cityInput = TextEditingController();

  @override
  void initState() {
    nameInput.text = SharedService.loginDetails()!.data!.data!.name.toString();
    emailInput.text =
        SharedService.loginDetails()!.data!.data!.email.toString();
    super.initState();
    phonenoInput.text =
        SharedService.loginDetails()!.data!.data!.phoneNumber.toString();
    super.initState();
    passwordInput.text =
        SharedService.loginDetails()!.data!.data!.password.toString();
    super.initState();
    cityInput.text =
        SharedService.loginDetails()!.data!.data!.address.toString();
    super.initState();
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
          extra: appbar(
              "assets/My_account/avatar.png", " Edit Details", context, () {
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
                      "Name*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller: nameInput,
                      decoration: InputDecoration(
                        hintText: "Enter your name",
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
                      controller: emailInput, // Fixed the controller name here
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
                      "Password*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller: passwordInput,
                      decoration: InputDecoration(
                        hintText: "Enter new password",
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
                      "City*",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                    TextField(
                      controller: cityInput,
                      decoration: InputDecoration(
                        hintText: "Enter your city",
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
                      if (nameInput.text ==
                              SharedService.loginDetails()!
                                  .data!
                                  .data!
                                  .name
                                  .toString() &&
                          emailInput.text ==
                              SharedService.loginDetails()!
                                  .data!
                                  .data!
                                  .email
                                  .toString() &&
                          phonenoInput.text ==
                              SharedService.loginDetails()!
                                  .data!
                                  .data!
                                  .phoneNumber
                                  .toString() &&
                          passwordInput.text ==
                              SharedService.loginDetails()!
                                  .data!
                                  .data!
                                  .password
                                  .toString() &&
                          cityInput.text ==
                              SharedService.loginDetails()!
                                  .data!
                                  .data!
                                  .address
                                  .toString()) {
                        EasyLoading.showInfo("Nothing to update");
                      } else {
                        ApiServices.updateMyAccountTeacher(
                                nameInput.text,
                                emailInput.text,
                                phonenoInput.text,
                                passwordInput.text,
                                cityInput.text)
                            .then((value) {
                          if (value == true) {
                            EasyLoading.showSuccess("Updated Successfully");
                          
                          } else if (value == false) {
                            EasyLoading.showSuccess("Something Went Wrong");
                          }
                        });
                      }
                    },
                    child: const Text(
                      "SUBMIT",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_management_system/Services/firebase_api_services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Services/api_services.dart';
import '../Dashboard.dart';
import 'forgot_password.dart'; // Assuming you have a file for ForgotPasswordScreen
import '../../constants/style.dart';
import '../../widget/Button/my_elevatedbutton.dart';

class NewLoginScreen extends StatefulWidget {
  String role;
  NewLoginScreen({Key? key, required this.role});

  @override
  State<NewLoginScreen> createState() => _NewLoginScreenState();
}

class _NewLoginScreenState extends State<NewLoginScreen> {
  TextEditingController loginEmail = TextEditingController();
  TextEditingController loginPass = TextEditingController();
  bool passwordVisible = false;

  // Function to show a SnackBar
  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: height * 0.33,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [lightBlue, deepBlue]),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: width * 0.12,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: width * 0.1,
                    ),
                    Text(
                      "User",
                      style: GoogleFonts.inter(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Login",
                      style: GoogleFonts.inter(
                        fontSize: width * 0.12,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: width * 0.08,
                right: width * 0.08,
                top: width * 0.08,
              ),
              child: TextField(
                controller: loginEmail,
                decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: GoogleFonts.inter(
                    fontSize: 20,
                    color: const Color(0xFF505050),
                    fontWeight: FontWeight.w400,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: deepBlue,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: width * 0.08,
                right: width * 0.08,
                top: width * 0.08,
              ),
              child: TextField(
                controller: loginPass,
                obscureText: !passwordVisible,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: deepBlue,
                      width: 2,
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                    icon: passwordVisible
                        ? const Icon(
                            Icons.visibility,
                            color: Buttonc,
                          )
                        : Icon(
                            Icons.visibility_off,
                            color: deepBlue,
                          ),
                  ),
                  hintText: "Password",
                  hintStyle: GoogleFonts.inter(
                    fontSize: 20,
                    color: const Color(0xFF505050),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(right: width * 0.06),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: [
            //       TextButton(
            //         onPressed: () {
            //           Navigator.of(context).push(MaterialPageRoute(
            //             builder: (context) => const ForgotPassScreen(),
            //           ));
            //         },
            //         child: Text(
            //           "Forgot password?",
            //           style: GoogleFonts.inter(
            //             fontSize: 15,
            //             color: deepBlue,
            //             fontWeight: FontWeight.w400,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.14),
              child: MyElevatedButton(
                width: width * 0.8,
                height: 60,
                gradient: LinearGradient(colors: [lightBlue, deepBlue]),
                onPressed: () {
                  if (loginEmail.text.isEmpty || loginPass.text.isEmpty) {
                    showSnackBar("Please fill in both email and password.");
                  } else {
                    ApiServices.userLogin(loginEmail.text, loginPass.text,
                            widget.role, fcmToken, context)
                        .then((value) {
                      if (value == true) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Dashboard()),
                             
                           
                            ModalRoute.withName('/'));
                        
                           log("THis is the token sent to the server $fcmToken");
                        
                        showSnackBar("Login successful");
                      } else {
                        showSnackBar("Wrong email or password");
                      }
                    });
                  }
                },
                child: Text(
                  "LOGIN",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                log("Support");
                String? encodeQueryParameters(Map<String, String> params) {
                  return params.entries
                      .map((MapEntry<String, String> e) =>
                          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                      .join('&');
                }

                final Uri emailUrl = Uri(
                  scheme: 'mailto',
                  path: 'kalpita@cloudyml.com',
                  query: encodeQueryParameters(<String, String>{
                    'subject': "School app problems",
                    'body': "Dear sir/madam"
                  }),
                );
                if (await canLaunchUrl(emailUrl)) {
                  launchUrl(emailUrl);
                } else {
                  throw Exception('Could not launch $emailUrl');
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Unable to login? ",
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        color: const Color(0xFF787878),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Mail us",
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        color: deepBlue,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

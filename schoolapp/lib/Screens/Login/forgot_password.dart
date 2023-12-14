import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/style.dart';
import '../../widget/Button/my_elevatedbutton.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextEditingController email = TextEditingController();
    TextEditingController pass = TextEditingController();
    bool isChecked = false;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [lightBlue, deepBlue])),
            child: Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
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
                      height: height * 0.03,
                    ),
                    Text(
                      "Forgot",
                      style: GoogleFonts.inter(
                        fontSize: width * 0.12,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Password",
                      style: GoogleFonts.inter(
                        fontSize: width * 0.12,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30, top: 40),
            child: TextField(
              controller: email,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: deepBlue,
                    width: 2,
                  ),
                ),
                hintText: "Email",
                hintStyle: GoogleFonts.inter(
                  fontSize: 20,
                  color: Color.fromARGB(255, 80, 80, 80),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30, top: 40),
            child: TextField(
              controller: pass,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: deepBlue,
                    width: 2,
                  ),
                ),
                hintText: "Password",
                hintStyle: GoogleFonts.inter(
                  fontSize: 20,
                  color: Color.fromARGB(255, 80, 80, 80),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30, top: 40),
            child: TextField(
              controller: pass,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: deepBlue,
                    width: 2,
                  ),
                ),
                hintText: "Re-Enter password",
                hintStyle: GoogleFonts.inter(
                  fontSize: 20,
                  color: Color.fromARGB(255, 80, 80, 80),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.09),
            child: MyElevatedButton(
                width: 300,
                height: 60,
                gradient: LinearGradient(colors: [lightBlue, deepBlue]),
                onPressed: () {},
                child: Text(
                  "SUBMIT",
                  style: GoogleFonts.poppins(color: Colors.white),
                )),
          ),
        ]),
      ),
    );
  }
}

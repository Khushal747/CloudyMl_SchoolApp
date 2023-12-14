import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/style.dart';
import '../../../widget/appBar/appbar_widget.dart';
import '../../../widget/appBar/decorative_apbar_widget.dart';
import 'view_result.dart';

class SelectResultType extends StatelessWidget {
  const SelectResultType({super.key});

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
          extra: appbar("assets/result1.png", " Results", context, () {
            Navigator.pop(context);
          }),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: width * 0.9,
                child: const Center(
                  child: Text(
                    "Select exam to see result",
                    style: TextStyle(
                        fontSize: 23,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StudentSeeOwnResult(
                                  testType: 'class test',
                                )));
                  },
                  child: Container(
                    height: height * 0.16,
                    width: width * 0.46,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(3, 3), // Offset in the Y direction
                        ),
                      ],
                      border: Border.all(color: deepBlue),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: deepBlue,
                          radius: width * 0.07,
                          child: Text(
                            "CT",
                            style: GoogleFonts.kalam(
                                fontSize: width * 0.06,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Class - Test",
                          style: TextStyle(
                              color: Colors.black, fontSize: width * 0.06),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StudentSeeOwnResult(
                                  testType: 'mid term',
                                )));
                  },
                  child: Container(
                    height: height * 0.16,
                    width: width * 0.46,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(3, 3), // Offset in the Y direction
                        ),
                      ],
                      border: Border.all(color: deepBlue),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: deepBlue,
                          radius: width * 0.07,
                          child: Text(
                            "MT",
                            style: GoogleFonts.kalam(
                                fontSize: width * 0.06,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Mid - Term",
                          style: TextStyle(
                              color: Colors.black, fontSize: width * 0.06),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StudentSeeOwnResult(
                                  testType: 'final term',
                                )));
                  },
                  child: Container(
                    height: height * 0.16,
                    width: width * 0.46,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(3, 3), // Offset in the Y direction
                        ),
                      ],
                      border: Border.all(color: deepBlue),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: deepBlue,
                          radius: width * 0.07,
                          child: Text(
                            "FT",
                            style: GoogleFonts.kalam(
                                fontSize: width * 0.06,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Final - Term",
                          style: TextStyle(
                              color: Colors.black, fontSize: width * 0.06),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

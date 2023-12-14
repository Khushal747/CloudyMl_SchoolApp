import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget appbar(
  String imageLink,
  String Heading,
  BuildContext context,
  VoidCallback backButton,
) {
  var height = MediaQuery.of(context).size.height;
  return Container(
    child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsets.only(top: height * 0.07, left: height * 0.03),
        child: InkWell(
          onTap: backButton,
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: height * 0.07, left: height * 0.02),
        child: Row(
          children: [
            Container(
              width: 35,
              height: 35,
              child: Image.asset(imageLink),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: SizedBox(
                width: height * 0.3,
                child: Text(Heading,
                    style: GoogleFonts.inter(
                        color: Colors.white,
                        letterSpacing: 1.0,
                        fontSize: height * 0.03,
                        fontWeight: FontWeight.w500)),
              ),
            ),
          ],
        ),
      ),
    ]),
  );
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_management_system/Screens/Login/login_screen.dart';
import '../../constants/style.dart';
import '../../widget/appBar/decorative_apbar_widget.dart';

class RoleSelectScreen extends StatefulWidget {
  const RoleSelectScreen({super.key});

  @override
  State<RoleSelectScreen> createState() => _RoleSelectScreen();
}

class _RoleSelectScreen extends State<RoleSelectScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          DecorativeAppBar(
            barHeight: MediaQuery.of(context).size.height * 0.24,
            barPad: MediaQuery.of(context).size.height * 0.19,
            radii: 30,
            background: Colors.white,
            gradient1: lightBlue,
            gradient2: deepBlue,
            extra: Padding(
              padding: EdgeInsets.only(
                  top: height * 0.08, left: width * 0.1, right: width * 0.15),
              child: Text("Select Your Role",
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      letterSpacing: 1.0,
                      fontSize: 30,
                      fontWeight: FontWeight.w500)),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => NewLoginScreen(
                  role: 'student',
                ),
              ));
            },
            child: roleContainer("assets/Role/student.png", "Student", context),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => NewLoginScreen(
                        role: 'teacher',
                      )));
            },
            child: roleContainer(
              "assets/Role/teacher.png",
              "Teacher",
              context,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => NewLoginScreen(
                        role: 'parent',
                      )));
            },
            child: roleContainer(
              "assets/Role/parent.png",
              "Parent",
              context,
            ),
          )
        ]),
      ),
    );
  }
}

Widget roleContainer(String imglink, String text, BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return Padding(
    padding: const EdgeInsets.only(left: 40.0, right: 40, bottom: 35),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          border: Border.all(color: deepBlue, width: 2),
          boxShadow: const [
            BoxShadow(color: Color.fromARGB(255, 199, 198, 198), blurRadius: 20)
          ]),
      height: height * 0.18,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Text(
            text,
            style: GoogleFonts.inter(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: SizedBox(
              width: width * 0.4,
              child: Image.asset(
                imglink,
                fit: BoxFit.fitHeight,
              )),
        ),
      ]),
    ),
  );
}

//..............................................................................

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:school_management_system/Screens/Login/login_screen.dart';
// import '../../constants/style.dart';
// import '../../widget/appBar/decorative_apbar_widget.dart';

// class RoleSelectScreen extends StatefulWidget {
//   const RoleSelectScreen({super.key});

//   @override
//   State<RoleSelectScreen> createState() => _RoleSelectScreen();
// }

// class _RoleSelectScreen extends State<RoleSelectScreen> {
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(400),
//         child: DecorativeAppBar(
//           barHeight: MediaQuery.of(context).size.height * 0.24,
//           barPad: MediaQuery.of(context).size.height * 0.19,
//           radii: 30,
//           background: Colors.white,
//           gradient1: lightBlue,
//           gradient2: deepBlue,
//           extra: Padding(
//             padding: EdgeInsets.only(
//                 top: height * 0.08, left: width * 0.1, right: width * 0.15),
//             child: Text("Select Your Role",
//                 style: GoogleFonts.inter(
//                     color: Colors.white,
//                     letterSpacing: 1.0,
//                     fontSize: 30,
//                     fontWeight: FontWeight.w500)),
//           ),
//         ),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           InkWell(
//             onTap: () {
//               Navigator.of(context).push(MaterialPageRoute(
//                 builder: (context) => NewLoginScreen(
//                   role: 'student',
//                 ),
//               ));
//             },
//             child: roleContainer("assets/Role/student.png", "Student", context),
//           ),
//           InkWell(
//             onTap: () {
//               Navigator.of(context).push(MaterialPageRoute(
//                   builder: (context) => NewLoginScreen(
//                         role: 'teacher',
//                       )));
//             },
//             child: roleContainer(
//               "assets/Role/teacher.png",
//               "Teacher",
//               context,
//             ),
//           ),
//           // InkWell(
//           //   onTap: () {
//           //     Navigator.of(context).push(MaterialPageRoute(
//           //         builder: (context) => NewLoginScreen(
//           //               role: 'parent',
//           //             )));
//           //   },
//           //   child: roleContainer(
//           //     "assets/Role/parent.png",
//           //     "Parent",
//           //     context,
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }

// Widget roleContainer(String imglink, String text, BuildContext context) {
//   double height = MediaQuery.of(context).size.height;
//   double width = MediaQuery.of(context).size.width;
//   return Padding(
//     padding: EdgeInsets.only(
//         left: width * 0.1, right: width * 0.1, bottom: height * 0.05),
//     child: Container(
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           color: Colors.white,
//           border: Border.all(color: deepBlue, width: 2),
//           boxShadow: const [
//             BoxShadow(color: Color.fromARGB(255, 199, 198, 198), blurRadius: 20)
//           ]),
//       height: height * 0.18,
//       child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
//         Padding(
//           padding: EdgeInsets.only(bottom: width * 0.04),
//           child: Text(
//             text,
//             style: GoogleFonts.inter(
//               fontSize: width * 0.075,
//               color: Colors.black,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.only(
//             top: height * 0.045,
//           ),
//           child: SizedBox(
//               width: width * 0.4,
//               child: Image.asset(
//                 imglink,
//                 fit: BoxFit.fitHeight,
//               )),
//         ),
//       ]),
//     ),
//   );
// }

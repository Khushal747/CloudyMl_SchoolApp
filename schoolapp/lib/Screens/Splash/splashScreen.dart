// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// import '../Services/shared_services.dart';
// import 'Dashboard.dart';
// import 'LoginScreen.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     log("im in splash");
//     Future.delayed(const Duration(seconds: 1), () {
//       if (SharedService.isLoggedIn()) {
//         Navigator.pushReplacement(context,
//             MaterialPageRoute(builder: (context) => const Dashboard()));
//       } else {
//         Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (context) => LoginScreen()));
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black26,
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         elevation: 0.0,
//         backgroundColor: Colors.transparent,
//       ),
//       body: SingleChildScrollView(
//         child: Stack(
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ClipRRect(
//                   borderRadius: const BorderRadius.only(
//                       topRight: Radius.circular(45),
//                       topLeft: Radius.circular(45)),
//                   child: Container(
//                     padding: const EdgeInsets.all(26),
//                     alignment: Alignment.centerLeft,
//                     height: MediaQuery.of(context).size.height * 0.99,
//                     width: double.maxFinite,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           height: 90,
//                         ),
//                         const Center(
//                           child: Text(
//                             "Welcome!",
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 35,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 130,
//                         ),
//                         Center(
//                           child: Container(
//                             height: 250,
//                             // child: Image.network(
//                             //     "https://img.freepik.com/free-photo/front-view-stacked-books-graduation-cap-diploma-education-day_23-2149241011.jpg?w=740&t=st=1690826211~exp=1690826811~hmac=c57315835a610ee77ad1ef5d8cfb6c9043e8125f0fc60d089ae1e43be1ac7c4a"
//                             //     ),
//                             child: Lottie.asset("assets/Lottie/data.json"),
//                             // child: Lottie.network(
//                             //     "https://lottie.host/30e2e76a-4015-4d6d-81b0-6f4b5324cbdb/9emmOYIsaL.json"),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 150,
//                         ),
//                         Align(
//                           alignment: Alignment.bottomCenter,
//                           child: const Center(
//                             child: Text(
//                               "School Management System",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 25,
//                                   fontWeight: FontWeight.w400),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//..... Above one is Perfectly working code ( OLD) .......

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:school_management_system/Screens/Login/role_choose_screen.dart';
import '../../Services/shared_services.dart';
import '../Dashboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    log("im in splash");
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (SharedService.isLoggedIn()) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const Dashboard()));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const RoleSelectScreen()));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset("assets/Flash Screen.png"),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.width * 0.8,
              ),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "School",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.09,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Management",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.1,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "App",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.09,
                          fontWeight: FontWeight.bold),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(
                    //     top: MediaQuery.of(context).size.height * 0.2,
                    //   ),
                    //   child: Center(
                    //     child: MyElevatedButton(
                    //         height: MediaQuery.of(context).size.height * 0.07,
                    //         width: MediaQuery.of(context).size.height * 0.25,
                    //         onPressed: () {
                    //           Navigator.of(context).push(MaterialPageRoute(
                    //               builder: (context) => RoleSelectScreen()));
                    //         },
                    //         child: Text(
                    //           "Start Now !",
                    //           style: TextStyle(
                    //               color: Colors.white,
                    //               fontSize:
                    //                   MediaQuery.of(context).size.width * 0.06,
                    //               fontWeight: FontWeight.bold),
                    //         )),
                    //   ),
                    // ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

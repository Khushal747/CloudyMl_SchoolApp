
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Services/shared_services.dart';
import '../../../constants/style.dart';
import '../../../widget/Role_Control/dashboard_gridview_data.dart';
import '../../../widget/appBar/decorative_apbar_widget.dart';
import '../../Splash/splashScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeScreen> {
  bool check = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      //  backgroundColor: Color.fromARGB(255, 238, 237, 237),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(600),
        child: DecorativeAppBar(
            barHeight: height * 0.32,
            barPad: height * 0.28,
            radii: 30,
            background: const Color.fromARGB(255, 238, 238, 238),
            gradient1: lightBlue,
            gradient2: deepBlue,
            extra: Padding(
              padding: EdgeInsets.only(top: height * 0.05, left: height * 0.03),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.height * 0.36,
                        child: Text(
                          "Hi, ${SharedService.loginDetails()?.data!.data!.name}",
                          softWrap: true,
                          maxLines: 20,
                          overflow: TextOverflow.fade,
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            letterSpacing: 1.0,
                            fontSize: height * 0.03,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.logout_outlined,
                          color: Colors.black,
                          size: 30,
                        ),
                        onPressed: () {
                          SharedService.logout(context).then((value) {
                            if (value == true) {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const SplashScreen()),
                                  (Route<dynamic> route) => false);
                            }
                          });
                        },
                        // child: const Text('LOGOUT'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.height * 0.4,
                        child: Text("HSK International School, Delhi",
                            softWrap: true,
                            maxLines: 10,
                            overflow: TextOverflow.fade,
                            style: GoogleFonts.inter(
                                color: Colors.white,
                                //  letterSpacing: 1.0,
                                fontSize: height * 0.04,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 40, right: 40),
            child: Row(children: <Widget>[
              Expanded(child: Divider()),
              Text(
                "  Dashboard  ",
                style: TextStyle(fontSize: 25),
              ),
              Expanded(child: Divider()),
            ]),
          ),
          Expanded(
            // Wrap the Column with Expanded
            child: GridView.builder(
              itemCount: categoryList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemBuilder: (context, index) {
                CategoryData category = categoryList[index];
                return CategoryBox(
                  data: category,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:school_management_system/Screens/Gallery/student/view_gallery_student.dart';
import '../../../constants/style.dart';
import '../../../widget/appBar/appbar_widget.dart';
import '../../../widget/appBar/decorative_apbar_widget.dart';

class GalleryDetailedScreen extends StatelessWidget {
  final String imgurl;

  GalleryDetailedScreen({required this.imgurl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(300),
        child: DecorativeAppBar(
          barHeight: MediaQuery.of(context).size.height * 0.22,
          barPad: MediaQuery.of(context).size.height * 0.16,
          radii: 30,
          background: Colors.white,
          gradient1: lightBlue,
          gradient2: deepBlue,
          extra: appbar("assets/gallery2.png", "School Gallery", context, () {
            Navigator.pop(context);
          }),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                child: Image.network(imgurl, fit: BoxFit.contain),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

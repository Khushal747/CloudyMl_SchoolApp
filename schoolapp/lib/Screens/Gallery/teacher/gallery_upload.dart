import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:school_management_system/Services/api_services.dart';
import 'dart:io';
import 'package:school_management_system/constants/style.dart';
import 'package:school_management_system/widget/Button/my_elevatedbutton.dart';

import '../../../widget/appBar/appbar_widget.dart';
import '../../../widget/appBar/decorative_apbar_widget.dart';

class UploadGallery extends StatefulWidget {
  const UploadGallery({Key? key}) : super(key: key);

  @override
  State<UploadGallery> createState() => _UploadGalleryState();
}

class _UploadGalleryState extends State<UploadGallery> {
  List<XFile> selectedImages = []; // Store selected images

  Future<void> pickImages() async {
    final List<XFile>? images = await ImagePicker().pickMultiImage();
    if (images != null && images.isNotEmpty) {
      setState(() {
        selectedImages = images;
      });
    }
  }

  void showFailureSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.red,
        content: Text('Please Choose photos from gallery'),
        duration: Duration(seconds: 3),
      ),
    );
  }

  void showSuccessSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.green,
        content: Text('Photo Upload Successfully'),
        duration: Duration(seconds: 3),
      ),
    );
  }

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
          extra: appbar("assets/rounded_plus.png", "Upload Photo", context, () {
            Navigator.pop(context);
          }),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                      child: Text(
                    "Create your school gallery 🖼️",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      decoration: TextDecoration.none,
                    ),
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Add media",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      Text(
                        "Add img, poster, flyers",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  if (selectedImages
                      .isNotEmpty) // Show images only when there are selected images
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: selectedImages.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.file(
                              File(selectedImages[index].path),
                              width: 160,
                              height: 130,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: pickImages,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8.0), // Adjust the value for desired border radius
                            side: const BorderSide(
                                color: Buttonc), // Outline color
                          ),
                          padding: const EdgeInsets.all(
                              16.0), // Adjust padding as needed
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.add,
                              color: deepBlue,
                              size: 35,
                            ), // Replace with your desired icon
                            const SizedBox(
                                width:
                                    8.0), // Adjust spacing between icon and text
                            Text(
                              "Add photos",
                              style: TextStyle(
                                  color: deepBlue, fontSize: 20), // Text color
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      MyElevatedButton(
                        onPressed: () {
                          log("Total Selected Image: ${selectedImages.length.toString()}");
                          ApiServices.teacherUploadGallery(selectedImages)
                              .then((value) {
                            if (value == true) {
                              showSuccessSnackbar();
                              Navigator.pop(context);
                            } else {
                              showFailureSnackbar();
                            }
                          });
                        },
                        height: MediaQuery.of(context).size.width * 0.115,
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: const Text(
                          'Save',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

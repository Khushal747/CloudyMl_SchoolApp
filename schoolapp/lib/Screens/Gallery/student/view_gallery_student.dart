
import 'package:flutter/material.dart';
import 'package:school_management_system/Services/api_services.dart';
import '../../../Models/Student/Gallery/view_gallery_response_model.dart';
import '../../../constants/style.dart';
import '../../../widget/appBar/appbar_widget.dart';
import '../../../widget/appBar/decorative_apbar_widget.dart';
import '../../Dashboard.dart';
import 'view_single_photo.dart';

class ViewGallery extends StatefulWidget {
  const ViewGallery({
    super.key,
  });

  @override
  State<ViewGallery> createState() => _ViewGalleryStudentsState();
}

class _ViewGalleryStudentsState extends State<ViewGallery> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: DecorativeAppBar(
          barHeight: MediaQuery.of(context).size.height * 0.22,
          barPad: MediaQuery.of(context).size.height * 0.16,
          radii: 30,
          background: Colors.white,
          gradient1: lightBlue,
          gradient2: deepBlue,
          extra: appbar("assets/gallery2.png", "School Gallery", context, () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const Dashboard()));
          }),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(10),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: FutureBuilder<ViewGalleryResponseModel>(
                  future: ApiServices.viewSchoolGallery(),
                  builder: (context, snapshot) {
                    ViewGalleryResponseModel? schoolGall = snapshot.data;
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // If the Future is still running, show a circular progress indicator.
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      // If there was an error while fetching data, display an error message.
                      return Center(
                        child: Text('Error:'),
                      );
                    } else if (!snapshot.hasData ||
                        schoolGall?.data?.isEmpty == true ||
                        schoolGall!.data![0].uploadedImage!.isEmpty) {
                      // If there's no data or the data list is empty, you can display a message.
                      return Center(
                        child: Text('No images available.'),
                      );
                    } else {
                      // If data is available, build the GridView.

                      return GridView.builder(
                        itemCount: schoolGall!.data![0].uploadedImage!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 4,
                          crossAxisCount: 3,
                          childAspectRatio: 2 / 3,
                          mainAxisSpacing: 4,
                        ),
                        itemBuilder: ((context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GalleryDetailedScreen(
                                    imgurl: schoolGall
                                        .data![0].uploadedImage![index].link
                                        .toString(),
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              color: Colors.white,
                              child: Image.network(
                                schoolGall.data![0].uploadedImage![index].link
                                    .toString(),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }),
                      );
                    }
                  },
                )),
          )),
          // InkWell(
          //   onTap: () {
          //     lodemore();
          //   },
          //   child: Container(
          //     color: Colors.black,
          //     height: 60,
          //     width: double.infinity,
          //     child: const Center(
          //       child: Text(
          //         'Load More',
          //         style: TextStyle(fontSize: 20, color: Colors.white),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

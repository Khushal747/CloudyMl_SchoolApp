import 'package:flutter/material.dart';
import 'package:school_management_system/Services/api_services.dart';
import '../../../Models/Student/Awards/view_awards_response_model.dart';
import '../../../constants/style.dart';
import '../../../widget/appBar/appbar_widget.dart';
import '../../../widget/appBar/decorative_apbar_widget.dart';
import '../../../widget/student/Awards/view_awards_card.dart';
import '../../Dashboard.dart';
import 'package:intl/intl.dart';

class StudentViewAwards extends StatelessWidget {
  const StudentViewAwards({super.key});

  @override
  Widget build(BuildContext context) {
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
            extra: appbar("assets/awards_trophy.png", " Awards", context, () {
              Navigator.pop(context);
            }),
          ),
        ),
        body: FutureBuilder<StudentViewAwardsResponseModel>(
          future: ApiServices.viewMyCertificates(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // While the future is running, show a CircularProgressIndicator
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              // If the future encounters an error, show an error message
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.data == null) {
              // If there is no data, show a message
              return Text('No data available.');
            } else {
              StudentViewAwardsResponseModel? studentCertificates =
                  snapshot.data;

              return ListView.builder(
                itemCount: studentCertificates!.data!.awardList!.length,
                itemBuilder: (BuildContext context, int index) {
                  return StudentViewAwardsCard(
                    heading: studentCertificates
                        .data!.awardList![index].certificationHeading
                        .toString(),
                    // date: DateFormat('dd-MM-yyyy').format(
                    //   DateTime.parse(studentCertificates
                    //       .data!.awardList![index].certificationDate
                    //       .toString()),
                    // ),
                    date: studentCertificates
                        .data!.awardList![index].certificationDate
                        .toString(),
                    image: studentCertificates.data!.awardList![index].link
                        .toString(),
                  );
                },
              );
            }
          },
        ));
  }
}

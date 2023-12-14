import 'package:flutter/material.dart';
import 'package:school_management_system/Services/api_services.dart';
import '../../../../Models/Teacher/Awards/class_wise_awards_list_response_model.dart';
import '../../../../constants/style.dart';
import '../../../../widget/appBar/appbar_widget.dart';
import '../../../../widget/appBar/decorative_apbar_widget.dart';
import '../../../../widget/teacher/Awards/class_wise_awards_card.dart';
import 'award_list_of_particular_student.dart';

class ViewAwardsOfClassScreen extends StatelessWidget {
  String selectedClass;
  String selectedSection;
  ViewAwardsOfClassScreen(
      {super.key, required this.selectedClass, required this.selectedSection});

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
          extra: appbar("assets/awards.png", "View Awards", context, () {
            Navigator.pop(context);
          }),
        ),
      ),
      body: FutureBuilder<ClassWiseAwardsListOfStudentsResponseModel>(
        future: ApiServices.classWiseAwardsListOfStudents(
            selectedClass, selectedSection),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            // Handle error
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData ||
              snapshot.data!.message == "data not found") {
            return const Center(
              child: Text(
                'No awards found',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
            );
          } else {
            ClassWiseAwardsListOfStudentsResponseModel?
                classWiseStudentsAwards = snapshot.data;

            return ListView.builder(
              itemCount: classWiseStudentsAwards!.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: ClassWiseViewAwardsCard(
                    studentName: classWiseStudentsAwards
                        .data![index].studentName
                        .toString(),
                    studentRoll: classWiseStudentsAwards.data![index].rollNumber
                        .toString(),
                    onPressed: () {
                      List<String> headingList = [];
                      List<String> awardsList = [];
                      List<String> dateList = [];
                      for (var i = 0;
                          i <
                              classWiseStudentsAwards
                                  .data![index].awardList!.length;
                          i++) {
                        headingList.add(classWiseStudentsAwards
                            .data![index].awardList![i].certificationHeading
                            .toString());
                        awardsList.add(classWiseStudentsAwards
                            .data![index].awardList![i].link
                            .toString());
                        dateList.add(classWiseStudentsAwards
                            .data![index].awardList![i].certificationDate
                            .toString());
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AwardListOfParticularStudent(
                            heading: headingList,
                            index: index,
                            totalCount: headingList.length,
                            awardDate: dateList,
                            awardImage: awardsList,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

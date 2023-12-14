import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:school_management_system/Services/api_services.dart';
import '../../../../constants/style.dart';
import '../../../../widget/appBar/appbar_widget.dart';
import '../../../../widget/appBar/decorative_apbar_widget.dart';
import '../../../Models/Student/Events/Register_Event/my_enrolled_events_list_model.dart';
import '../../../widget/student/Events/Enrolled Events/student_my_enrolled_events_card.dart';

class StudentMyEnrollledEvents extends StatelessWidget {
  const StudentMyEnrollledEvents({
    super.key,
  });

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
          extra:
              appbar("assets/add_events.png", "Enrolled Events", context, () {
            Navigator.pop(context);
          }),
        ),
      ),
      body: FutureBuilder<StudentMyEnrolledEventsResponseModel>(
        future: ApiServices.studentSeeMyEnrolledEvents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Text('Error: ...');
          } else if (!snapshot.hasData || snapshot.data!.data == null) {
            return const Center(child: Text('No events found.'));
          } else {
            StudentMyEnrolledEventsResponseModel? eventList = snapshot.data;
            return ListView.builder(
                itemCount: eventList!.data!.eventList!.length,
                itemBuilder: (context, index) {
                  String formattedDate = DateFormat('dd-MM-yyyy').format(
                    DateTime.parse(
                      eventList.data!.eventList![index].eventDate.toString(),
                    ),
                  );
                  return StudentMyEnrolledEventsCard(
                    eventHeading:
                        eventList.data!.eventList![index].eventName.toString(),
                    eventDate: formattedDate,
                    eventTime:
                        eventList.data!.eventList![index].eventTime.toString(),
                  );
                });
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:school_management_system/constants/style.dart';
import 'Days/friday.dart';
import 'Days/monday.dart';
import 'Days/saturday.dart';
import 'Days/thursday.dart';
import 'Days/tuesday.dart';
import 'Days/wednesday.dart';

// ignore: must_be_immutable
class TeacherTimetableSet extends StatefulWidget {
  String wclass;
  String section;
  TeacherTimetableSet({super.key, required this.wclass, required this.section});

  @override
  State<TeacherTimetableSet> createState() => _TeacherTimetableSetState();
}

class _TeacherTimetableSetState extends State<TeacherTimetableSet> {
  int _currentIndex = 0;

  final List<String> daysOfWeek = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [lightBlue, deepBlue], // Customize your gradient colors
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text(
          daysOfWeek[_currentIndex],
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(daysOfWeek.length, (index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    child: Container(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      width: 110,
                      height: 55,
                      child: Card(
                        color: _currentIndex == index
                            ? Colors.green
                            : const Color.fromRGBO(98, 120, 247, 1.0),
                        child: Center(
                          child: Text(
                            daysOfWeek[index],
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.828,
              child: getPageWidget(_currentIndex),
            ),
          ],
        ),
      ),
    );
  }

  Widget getPageWidget(int index) {
    switch (index) {
      case 0:
        return Monday(
          selectedClass: widget.wclass,
          selectedSection: widget.section,
        );
      case 1:
        return Tuesday(
          selectedClass: widget.wclass,
          selectedSection: widget.section,
        );
      case 2:
        return Wednesday(
          selectedClass: widget.wclass,
          selectedSection: widget.section,
        );
      case 3:
        return Thursday(
          selectedClass: widget.wclass,
          selectedSection: widget.section,
        );
      case 4:
        return Friday(
          selectedClass: widget.wclass,
          selectedSection: widget.section,
        );
      case 5:
        return Saturday(
          selectedClass: widget.wclass,
          selectedSection: widget.section,
        );

      default:
        return const Text("8 Page");
    }
  }
}

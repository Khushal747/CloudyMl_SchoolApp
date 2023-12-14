import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:school_management_system/widget/Button/my_elevatedbutton.dart';
import 'package:school_management_system/widget/appBar/appbar_widget.dart';
import 'package:school_management_system/widget/appBar/decorative_apbar_widget.dart';
import '../../../constants/style.dart';
import '../../../widget/Button/Blue_Button.dart';
import 'month_attendance_students.dart';

class MonthYearSelectForSeeingAttendance extends StatefulWidget {
  const MonthYearSelectForSeeingAttendance({Key? key}) : super(key: key);

  @override
  State<MonthYearSelectForSeeingAttendance> createState() =>
      _MonthYearSelectForSeeingAttendanceState();
}

class _MonthYearSelectForSeeingAttendanceState
    extends State<MonthYearSelectForSeeingAttendance> {
  String selectMonth = 'Choose month'; // Set to default option
  String selectYear = 'Choose year'; // Set to default option

  List<String> classOptions = [
    'Choose month',
    '1',
    '2',
    '3',
    "4",
    '5',
    '6',
    '7',
    "8",
    '9',
    '10',
    '11',
    "12",
  ];
  List<String> sectionOptions = [
    'Choose year',
    '2015',
    '2016',
    '2017',
    '2018',
    '2019',
    '2020',
    '2021',
    '2022',
    '2023',
    '2024',
    '2025'
  ];

  @override
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
          extra:
              appbar("assets/attendance_appbar.png", "Attendance", context, () {
            Navigator.pop(context);
          }),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.68,
                child: DropdownButtonFormField<String>(
                  value: selectMonth,
                  onChanged: (value) {
                    if (value != 'Choose month') {
                      setState(() {
                        selectMonth = value!;
                      });
                    }
                  },
                  items: classOptions
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.date_range,
                      color: deepBlue,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: deepBlue,
                        width: 3,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.68,
                child: DropdownButtonFormField<String>(
                  value: selectYear,
                  onChanged: (value) {
                    if (value != 'Choose year') {
                      setState(() {
                        selectYear = value!;
                      });
                    }
                  },
                  items: sectionOptions
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.date_range,
                      color: deepBlue,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: deepBlue,
                        width: 3,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const SizedBox(
                height: 40,
              ),
              MyElevatedButton(
                width: MediaQuery.of(context).size.width * 0.68,
                child: const Text(
                  "SUBMIT",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if (selectMonth == 'Choose month' ||
                      selectYear == 'Choose year') {
                    return; // Exit function if default values are selected
                  } else {
                    log("selectMonth=$selectMonth");
                    log("selectYear=$selectYear");
                    print("selectMonth=$selectMonth");
                    print("selectYear=$selectYear");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MonthAttendance(
                          month: selectMonth,
                          year: selectYear,
                        ),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import '../../../../constants/style.dart';
import '../../../../widget/appBar/appbar_widget.dart';
import '../../../../widget/appBar/decorative_apbar_widget.dart';
import 'package:intl/intl.dart';

class AwardListOfParticularStudent extends StatelessWidget {
  final List<String> heading;
  final List<String> awardDate;
  final List<String> awardImage;
  int index;
  int totalCount;

  AwardListOfParticularStudent(
      {super.key,
      required this.heading,
      required this.index,
      required this.totalCount,
      required this.awardDate,
      required this.awardImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        DecorativeAppBar(
          barHeight: MediaQuery.of(context).size.height * 0.24,
          barPad: MediaQuery.of(context).size.height * 0.19,
          radii: 30,
          background: Colors.white,
          gradient1: lightBlue,
          gradient2: deepBlue,
          extra: appbar(
            "assets/add_events.png",
            "View Awards",
            context,
            () {
              Navigator.pop(context);
            },
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.7,
          color: Colors.white,
          child: ListView.builder(
            itemCount: totalCount,
            itemBuilder: (context, index) {
              DateTime date1 = DateTime.parse(awardDate[index]);
              String formattedDate = DateFormat('dd-MM-yyyy').format(date1);

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.height * 0.9,
                  padding: const EdgeInsets.all(16),
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: deepBlue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: MediaQuery.of(context).size.width,
                        child:
                            Image.network(awardImage[index], fit: BoxFit.fill),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          heading[index],
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            "Date: ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            formattedDate,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 18),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ));
  }
}

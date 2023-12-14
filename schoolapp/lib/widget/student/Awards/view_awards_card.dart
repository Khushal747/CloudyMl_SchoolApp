import 'package:flutter/material.dart';
import 'package:school_management_system/constants/style.dart';

class StudentViewAwardsCard extends StatelessWidget {
  final String heading;
  final String image;
  final String date;

  const StudentViewAwardsCard({
    required this.heading,
    required this.image,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.height * 0.9,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
            child: Image.network(image, fit: BoxFit.fill),
          ),
          const SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              heading,
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
                date,
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),
            ],
          )
        ],
      ),
    );
  }
}

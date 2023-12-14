import 'package:flutter/material.dart';
import '../../../constants/style.dart';

class OldDesignEventsCard extends StatelessWidget {
  final String headingText; // Corrected placement of parameter

  const OldDesignEventsCard({Key? key, required this.headingText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Container(
            height: MediaQuery.of(context).size.height * 0.45,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    headingText,
                    style: const TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Buttonc),
                  ),
                ),
                Container(
                    height: MediaQuery.of(context).size.width * 0.55,
                    width: double.infinity,
                    child: Image.asset("assets/events_sports.jpg")),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            "View Photos",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Buttonc,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              )),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            "Read More",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Buttonc,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              )),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ))
      ],
    );
  }
}

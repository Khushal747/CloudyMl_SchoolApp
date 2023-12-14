import 'package:flutter/material.dart';
import 'package:school_management_system/constants/style.dart';
import 'package:school_management_system/widget/Button/my_elevatedbutton.dart';

class ViewNoticeCard extends StatefulWidget {
  String title;
  String image;
  String isRead;
  final VoidCallback onClicked;
  ViewNoticeCard(
      {super.key,
      required this.image,
      required this.onClicked,
      required this.title,
      required this.isRead});

  @override
  State<ViewNoticeCard> createState() => _ViewNoticeCardState();
}

class _ViewNoticeCardState extends State<ViewNoticeCard> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Container(
        height: height * 0.17,
        width: width * 0.9,
        decoration: BoxDecoration(
            color: widget.isRead == "false"
                ? Color.fromARGB(255, 255, 215, 156)
                : Colors.white,
            // border: Border.symmetric(
            //   horizontal: BorderSide(color: deepBlue),
            // ),
            border: Border.all(color: deepBlue),
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  height: double.infinity,
                  width: width * 0.25,
                  child: Image.network(
                    widget.image,
                    fit: BoxFit.fill,
                  )),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: width * 0.63,
                      child: Text(widget.title),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    MyElevatedButton(
                      width: width * 0.3,
                      onPressed: () {
                        widget.onClicked();
                      },
                      child: const Text(
                        "View",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

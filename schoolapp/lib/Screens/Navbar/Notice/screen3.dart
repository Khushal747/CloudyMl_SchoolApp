import 'package:flutter/material.dart';

class screen3 extends StatefulWidget {
  const screen3({super.key});

  @override
  State<screen3> createState() => _MyWidgetState();
}

initState() {
  //api call
}

class _MyWidgetState extends State<screen3> {
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Notice Screen")));
  }
}

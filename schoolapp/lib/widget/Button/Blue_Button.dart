import 'package:flutter/material.dart';
import '../../constants/style.dart';

class SuperButton extends StatelessWidget {
  //Argument declearing place
  final String text;
  final Function screen;
  // final bool shade;
  const SuperButton({
    super.key,
    required this.text,
    required this.screen,
    //   required this.shade
  });

  @override
  Widget build(BuildContext context) {
// variable declaring place
    return ElevatedButton(
      onPressed: () {
        print('Button pressed!');
        screen();
      },
      style: ElevatedButton.styleFrom(
        // Increase the size of the button
        fixedSize: Size(
          MediaQuery.of(context).size.width * 0.68,
          MediaQuery.of(context).size.height * 0.06,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),

        //  backgroundColor: shade ? Buttonc : Colors.yellow,
        backgroundColor: Buttonc,
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}

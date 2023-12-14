import 'package:flutter/material.dart';
import 'package:school_management_system/constants/style.dart';

class RecElevatedButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;

  final VoidCallback? onPressed;
  final Widget child;

  const RecElevatedButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: Size(
            MediaQuery.of(context).size.width * 1,
            MediaQuery.of(context).size.height * 0.07,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
          backgroundColor: deepBlue,
        ),
        child: child,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DecorativeAppBar extends StatefulWidget {
  final double barHeight, barPad, radii;
  final Color gradient1, gradient2, background;
  final Widget? extra;

  DecorativeAppBar(
      {Key? key,
      required this.barHeight,
      required this.barPad,
      required this.radii,
      this.background = Colors.white,
      this.gradient1 = Colors.white,
      this.gradient2 = Colors.white,
      this.extra})
      : super(key: key);
  @override
  _DecorativeAppBarState createState() => _DecorativeAppBarState();
}

class _DecorativeAppBarState extends State<DecorativeAppBar> {
  @override
  Widget build(BuildContext context) {
    double z = widget.barHeight - widget.barPad;
    return Container(
        height: widget.barHeight,
        decoration: BoxDecoration(
          //  boxShadow: null,
          //  border: Border.all(),
          gradient:
              LinearGradient(colors: [widget.gradient1, widget.gradient2]),
        ),
        child: Stack(children: [
          if (widget.extra != null) widget.extra!,
          Column(
            children: [
              Container(
                height: z,
                margin: EdgeInsets.only(top: widget.barPad),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: widget.background,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(widget.radii)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 5,
                      spreadRadius: 0.2,
                      offset: const Offset(0.5, -8),
                    ),
                  ],
                ),
              )
            ],
          ),
        ]));
  }
}

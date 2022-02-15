//SANTAROSSA RICCARDO 5BIA 24/01/2022

// ignore_for_file: use_key_in_widget_constructors, camel_case_types, sized_box_for_whitespace, unnecessary_this

import 'package:flutter/cupertino.dart';

class mycontainer extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Border border;
  final BorderRadius radius;
  final String text;

  const mycontainer(
      {Key? key,
      required this.width,
      required this.height,
      required this.color,
      required this.border,
      required this.text,
      required this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      decoration: BoxDecoration(
          border: this.border, color: this.color, borderRadius: this.radius),
      child: Align(alignment: Alignment.center, child: Text(this.text)),
    );
  }
}

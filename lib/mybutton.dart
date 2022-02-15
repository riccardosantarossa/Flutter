//SANTAROSSA RICCARDO 5BIA 24/01/2022

// ignore_for_file: camel_case_types, library_prefixes, unnecessary_this, avoid_unnecessary_containers, deprecated_member_use, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:html/dom.dart' as htmlParser;

class myButton extends StatelessWidget {
  final Function() clicker;
  final String text;
  final Color color;

  const myButton(
      {Key? key,
      required this.clicker,
      required this.text,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: RaisedButton(
        onPressed: this.clicker,
        color: this.color,
        child:
            Text(htmlParser.DocumentFragment.html(this.text).text.toString()),
      ),
    );
  }
}

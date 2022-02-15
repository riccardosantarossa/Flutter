//SANTAROSSA RICCARDO 5BIA 14/12/2021

import 'package:flutter/material.dart';

class nostroBottone extends StatelessWidget
{
    nostroBottone(this.text, this.clickHandler, this.color);
    final String text;
    final Function() clickHandler;
    final Color color;

    @override
    Widget build(BuildContext context)
    {
      return Container
      (
        child: RaisedButton
        (
          child: Text(text),
          color: color,
          onPressed: clickHandler,
        ),
      );
    }
}
//SANTAROSSA RICCARDO 5BIA 16/12/2021

import 'package:flutter/material.dart';

class cambiaLingue extends StatelessWidget
{
    cambiaLingue(this.text, this.clickHandler, this.color);
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
          onPressed: clickHandler,
          color: Colors.lightGreen
        ),
      );
    }
}
//SANTAROSSA RICCARDO 5BIA 15/02/2022

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class homePage extends StatelessWidget 
{
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      
    );
  }
}
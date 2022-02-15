//SANTAROSSA RICCARDO 5BIA 24/01/2022

// ignore_for_file: file_names, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_web_libraries_in_flutter, unused_import

import 'package:flutter/material.dart';
import 'package:quizapp/mybutton.dart';
import 'package:quizapp/mycontainer.dart';

class resultScreen extends StatelessWidget {
  const resultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final correct = routeArgs['correct'].toString();
    final incorrect = routeArgs['incorrect'].toString();
    final points = (int.parse(correct)/10)*100;
    return Scaffold(
        appBar: AppBar(
          title: Text('QUIZ DIFFICILE'),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              mycontainer(
                  width: 300,
                  height: 50,
                  color: Colors.grey.shade300,
                  border: Border.all(),
                  text: 'Percentuale di correttezza: ' + points.toString() + " %",
                  radius: BorderRadius.circular(3)),
              mycontainer(
                  width: 300,
                  height: 50,
                  color: Colors.grey.shade300,
                  border: Border.all(),
                  text: 'Risposte corrette: ' + correct.toString(),
                  radius: BorderRadius.circular(3)),
              mycontainer(
                  width: 300,
                  height: 50,
                  color: Colors.grey.shade300,
                  border: Border.all(),
                  text: 'Risposte errate: ' + incorrect.toString(),
                  radius: BorderRadius.circular(3)),
              myButton(
                  clicker: () {
                    Navigator.pop(context);
                  },
                  text: 'Gioca di nuovo',
                  color: Colors.blue.shade300)
            ])));
  }
}

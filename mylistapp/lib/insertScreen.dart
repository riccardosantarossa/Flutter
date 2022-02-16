//SANTAROSSA RICCARDO 5BIA

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'todo.dart';

class insertScreen extends StatelessWidget {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  void passData(BuildContext ctx) {
    final todoToPass =
        new Todo(titleController.text, descriptionController.text);
    Navigator.pop(ctx, todoToPass);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Schermata di inserimento"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 300,
                child: TextField(
                    controller: titleController,
                    decoration:
                        InputDecoration(labelText: 'Inserire il titolo')),
              ),
              SizedBox(
                width: 300,
                child: TextField(
                    controller: descriptionController,
                    decoration:
                        InputDecoration(labelText: 'Inserire la descrizione')),
              ),
              RaisedButton(
                  color: Colors.blue,
                  child: Text('Submit'),
                  onPressed: () {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('Elemento inserito correttamente')));
                    passData(context);
                  }),
            ],
          ),
        ));
  }
}

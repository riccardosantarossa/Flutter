//SANTAROSSA RICCARDO 5BIA 13/01/2022

import 'package:flutter/material.dart';
import 'package:mylistapp/insertScreen.dart';
// ignore: unused_import
import 'SecondScreen.dart';
import 'todo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Listapp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'ListApp'),
      routes: {
        '/secondscreen': (ctx) => SecondScreen(),
        '/insertscreen': (ctx) => insertScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  MyHomePage.myconstr({required this.title});
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Todo> todos = [];

  void retrieveData(BuildContext context) async {
    final Todo data = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => insertScreen(),
        ));
    setState(() {
      todos.add(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            onTap: () {
              Navigator.of(context).pushNamed('/secondscreen', arguments: {
                'todo': todos[index],
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/insertscreen');
          retrieveData(context);
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
      ),
    );
  }
}

//SANTAROSSA RICCARDO 5BIA 24/01/2022

// ignore_for_file: prefer_const_constructors, library_prefixes, unused_import, prefer_const_declarations, deprecated_member_use, prefer_typing_uninitialized_variables, must_call_super, avoid_init_to_null, avoid_web_libraries_in_flutter
import 'dart:developer';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:html/dom_parsing.dart';
import 'package:html/dom.dart' as htmlParser;
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:quizapp/resultScreen.dart';
import 'dart:convert';
import 'Question.dart';
import 'mybutton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData
      (
        primarySwatch: Colors.blue,
      ),
      //Opzione tema scuro
      /*darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark, */
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {'/resultScreen': (_) => resultScreen()},
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Link al sito che fornisce le domande
  final url = "https://opentdb.com/api.php?amount=10";
  var _counter = 0;
  List<Question>? domande = null;
  List<String>? risposte = null;
  var correct = 0, incorrect = 0;

  //Funzione che scorre le domande
  void nextQuestion() {
    setState(() {
      if (_counter < domande!.length - 1) {
        _counter++;
      } else {
        _counter = 0;
        showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('FINITO'),
                  content: Text('HAI COMPLETATO LE DOMANDE BRAVO'),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('OK'),
                      onPressed: () {
                        doGet();
                        Navigator.of(ctx).pop(true);
                        Navigator.of(ctx)
                            .pushNamed('/resultScreen', arguments: {
                          'correct': correct,
                          'incorrect': incorrect,
                        });
                      },
                    )
                  ],
                ));
      }
      //Aggiorno l'interfaccia grafica
      risposte = List.from(domande![_counter].incorrect);
      risposte!.add(domande![_counter].correct);
      risposte!.shuffle();
    });
  }

  //Funzione che preleva i dati dal JSON 
  void doGet() {
    http.get(Uri.parse(url)).then((response) {
      var jsondata = json.decode(response.body);
      var questions = jsondata['results'];

      //Trasformo le domande prese dal JSON in una lista di oggetti di tipo domanda
      setState(() {
        domande =
            questions.map<Question>((val) => Question.fromJson(val)).toList();
        risposte = List.from(domande![_counter].incorrect);
        risposte!.add(domande![_counter].correct);
        risposte!.shuffle();
        correct = 0;
        incorrect = 0;
      });
    });
  }

  //Controllo l'esattezza delle risposte 
  void controllaRisposte(String answ) {
    String risp = "Risposta errata, SO SAD!!!";
    if (answ == domande![_counter].correct) {
      risp = "GG, RISPOSTA CORRETTA!!!";
      correct++;
      nextQuestion();
    } else {
      nextQuestion();
      incorrect++;
    }

    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text('RISULTATO'),
              content: Text(risp),
              actions: <Widget>[
                FlatButton(
                  child: Text('OK'),
                  onPressed: () => Navigator.of(ctx).pop(true),
                )
              ],
            ));
  }

  //Funzione che elimina un'opzione errata per facilitare l'utente se ha dubbi
  void giveHint() {
    var flag = false;
    var trov = false;

    for (var item in risposte!) {
      if (item != domande![_counter].correct && flag == false) {
        for (var i = 0; i < domande![_counter].incorrect.length; i++) {
          if (trov == false) {
            domande![_counter].incorrect[i] = "";
            trov = true;
          }
        }
      }
    }
    setState(() {
      risposte = List.from(domande![_counter].incorrect);
      risposte!.add(domande![_counter].correct);
      risposte!.shuffle();
    });
  }

  //Generazione dei bottoni
  List<myButton> creaBottoni(List<String> answ) {
    return answ
        .map<myButton>((e) => myButton(
            clicker: () => controllaRisposte(e),
            text: e,
            color: Colors.blue.shade300))
        .toList();
  }

  @override
  void initState() {
    doGet();
  }

  //Interfaccia grafica
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QUIZ DIFFICILE'),
        actions: <Widget>[FlatButton(onPressed: giveHint, child: Text('HELP'))],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // ignore: unnecessary_null_comparison
            if (domande != null && domande![0] != null)
              Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      htmlParser.DocumentFragment.html(
                              domande![_counter].question)
                          .text
                          .toString(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  height: 100,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10))),

            // ignore: unnecessary_null_comparison
            if (risposte != null && risposte != null)
              ...creaBottoni(risposte!)
            else
              CircularProgressIndicator(),

            Container(
              child:
                  Text('Domanda numero ' + (_counter + 1).toString() + '/10'),
            )
          ],
        ),
      ),
    );
  }
}

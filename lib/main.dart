//SANTAROSSA RICCARDO 5BIA 14/12/2021

import 'package:flutter/material.dart';
import 'package:helloflutter/nostroBottone.dart'; //direttiva presente in tutti i file dart

void main() {
  runApp(MyApp());
}

//Componente della GUI
class MyApp extends StatelessWidget {
  // Questa è la root della classe.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(  //Material design di google 
      title: 'SantarossApp',
      theme: ThemeData(
        //Questo è il tema dell'applicazione.
        //
        // Eseguire l'applicazione con il comando "flutter run". Si vedrà che
        // l'applicazione presenta una barra blu. Senza chiudere l'app
        // cambiare il tema in Colors.green e poi utilizzare il comando di 
        // "hot reload" (premi "r" nella console dopo aver usato "flutter run",
        // oppure salva il progetto come "hot reload" in un Flutter IDE).
        // Da notare che il counter non si è resettato in quanto
        // is not restarted.
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'SantarossApp'),  //Pagina iniziale dell'app
    );
  }
}
//widget con variabili di stato al suo interno. Lo stato viene gestito da un altro oggetto 
//la cui classe di appartenenza deriva dalla classe State<>
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key); //Parametri del costruttore passati in modo NOMINALE

  // Questo widget è il principale dell'applicazione . È stateful quindi al
  // suo interno contiene uno stato con delle variabili che definiscono 
  // come si vede la grafica.

  // Questa classe è la configurazione dello stato. Contiene i valori in questo
  // caso il titolo fornito dalla classe padre (l'app widget) e
  // usato dal costruttore dell'applicazione. I campi in una sottoclasse widget
  // sono sempre segnati come final.

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState(); //Aggancia la classe che contiene lo stato vero e proprio (STATEFUL) che c'è sotto
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var _colorCounter = 0;

  var _colors = [Colors.amber, Colors.red, Colors.blue, Colors.orange];

  void  _decrementCounter()
  {
     setState(() {
       _counter --;

      if (_colorCounter>0) 
        _colorCounter--;
      else
        _colorCounter= _colors.length-1;

     });
  }

  void _incrementCounter() {
    setState(() {
      // Questa chiamata a setState() dice a flutter che qualcosa è cambiato,
      // il framework quindi necessita di ricaricare lo stato
      // in modo che vengano rappresentati i valori aggiornati. Se viene cambiato 
      // _counter senza chiamare setState(), il metodo costruttore non viene chiamato di nuovo
      // e quindi non comparirebbe alcun cambiamento.
      _counter++; //Privato perché ha l'underscore

    if (_colorCounter<_colors.length-1) 
      _colorCounter++;
    else
      _colorCounter=0;

    });
  }

  @override
  Widget build(BuildContext context) {
    // Questo metodo è eseguito ogni volta che si richiama setState()
    //
    // Flutter è ottimizzato per eseguire tali chiamate in modo 
    // veloce, in modo che tu possa ricostruire solo ciò che necessita un aggiornamento
    // invece di cambiare tutte le singole istanze dei widget.
    return Scaffold(
      appBar: AppBar(
        // Qui viene preso il valore di MyhomePage
        // e viene modificato per far comparire la barra con il titolo.
        title: Text(widget.title),
      ),
      body: Center(
        // Center è un widget di layout. Prende una singola istanza widget figlio e la posiziona
        // nel mezzo dell'istanza padre.
        child: Column(
          // Column un altro widget di layout. Prende una lista di istanze figlio
          // e li dispone verticalmente. Di default si forma per arrangiare 
          // le istanze orizzontalmente, e prova a essere alto quanto l'istanza padre.
          //
          // Column ha varie proprietà per controllare il suo ridimensionamento e come 
          // posiziona le istanze figlio. Qui si usa mainAxisAlignment per
          // centrare le istanze figlio verticalmente; l'asse principale è quello
          // verticale perche Column è verticale.
          //
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            /*RaisedButton(
              child: Text('Decrement'),
              color: Colors.deepPurple,
              textColor: Colors.white,
              onPressed: _decrementCounter  
              ),*/
            nostroBottone('Pigia', _decrementCounter, _colors[_colorCounter])
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

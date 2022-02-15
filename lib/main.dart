import 'package:flutter/material.dart';
import 'package:newp/cambiaLingue.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.lightGreen,
      ),
      home: MyHomePage(title: 'Saluti in tutte le lingue del mondo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _linguecounter = 0;

  var _Lingue = [ 'Hello World', 'Ciao Mondo', 'Hola Mundo', 'Qo VIvan', 'talofa le lalolagi', 'maingalarpar kambhar lawk', 'ahoj svet', 'salve mundi'];

  void  _incrementCounter()
  {
     setState(() {

      if (_linguecounter<_Lingue.length-1) 
        _linguecounter++;
      else
        _linguecounter= 0 ;

     });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
      ),
      body: Center(
      
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text('Hello World'),
            
            cambiaLingue('Pigia per cambiare la lingua', _incrementCounter, Colors.lightGreen),
            
            Text(
                _Lingue[_linguecounter],
            ),
           
          ],
          
        ),
      ),
      
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tip Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'TIP CALCULATOR'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _percen;
  double _tipp;
  double _perp;

  @override
  initState(){
    _tipp = 0;
    _percen = 0;
    _perp = 0;
  }

  void _calculation() {
    setState((){
      _percen = ((int.parse(tpCon.text) * int.parse(percCon.text))/100) ;
      _tipp = (int.parse(tpCon.text) + _percen);
      _perp = ((int.parse(tpCon.text) + _percen ) /int.parse(peocCon.text) );
    },
    );
    print(_tipp);
    print(_percen);
  }

  final tpCon = TextEditingController();
  final percCon = TextEditingController();
  final peocCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: tpCon,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'BILL',
                ),
              ),
              TextField(
                controller: percCon,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'PERCENTAGE',
                ),
              ),
              TextField(
                controller: peocCon,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'PEOPLE',
                ),
              ),
              RaisedButton(
                onPressed: (_calculation),
                child: Text('CALCULATE'),
              ),
              Text('Your Total Bill is: $_tipp'),
              Text('Bill per person is: $_perp'),
            ],
          ),
        ),
      ),
    );
  }
}
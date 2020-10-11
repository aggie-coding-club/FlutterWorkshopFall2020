import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Roller',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Dice Roller'),
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
  int _die1Roll = 1;
  int _die2Roll = 6;

  void rollDice() {
    var random = new Random();
    int randNum1 = random.nextInt(6) + 1;
    int randNum2 = random.nextInt(6) + 1;
    setState(() {
      _die1Roll = randNum1;
      _die2Roll = randNum2;
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
            Padding(
              padding: const EdgeInsets.fromLTRB(0,0,0,100),
              child: Image.asset("assets/images/dicee_logo.png"),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/images/dice$_die1Roll.png"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/images/dice$_die2Roll.png"),
                ),
              ],
            ),
            Text(
              '${_die1Roll + _die2Roll}',
              style: Theme.of(context).textTheme.headline4,
            ),
            Container(
                margin: EdgeInsets.all(20),
                child: new OutlineButton(
                    child: new Text("ROLL DICE!"),
                    onPressed: () {
                      rollDice();
                    },
                    borderSide: BorderSide(color: Colors.red),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)))),
          ],
        ),
      ),
    );
  }
}

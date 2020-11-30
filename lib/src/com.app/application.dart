import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(
        title: 'Number Shapes',
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String _requirement = 'Please input a number to see if it is a square or triangular';

  final TextEditingController _givenNumber = TextEditingController();

  bool verifyIsTriangular() {
    for (int i = 1; i < int.parse(_givenNumber.text); i++) {
      if (i * i * i == int.parse(_givenNumber.text)) {
        return true;
      }
    }
    return false;
  }

  bool verifyIsSquare() {
    for (int i = 1; i < int.parse(_givenNumber.text); i++) {
      if (i * i == int.parse(_givenNumber.text)) {
        return true;
      }
    }
    return false;
  }

  void showAlertDialog(BuildContext context) {
    int n = int.parse(_givenNumber.text);
    final AlertDialog alert = AlertDialog(
      title: Text(
        _givenNumber.text,
      ),
      content: verifyIsSquare()==true && verifyIsTriangular()==true ? Text(
        'Number $n is booth SQUARE and TRIANGULAR.',
      ) : verifyIsSquare()==true ? Text(
        'Number $n is SQUARE.'
      ) : verifyIsTriangular()==true ? Text(
        'Number $n is TRIANGULAR'
      ) : Text(
        'Number $n is neither TRIANGULAR or SQUARE.'
      ),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(15.0),
            child: Center(
              child: Text(
                _requirement,
                textScaleFactor: 1.5,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: _givenNumber,
            ),
          ),
        ],
      ),
      floatingActionButton: Builder(
        builder: (BuildContext context) {
          return FloatingActionButton(
            child: const Icon(Icons.check),
            onPressed: () {
              showAlertDialog(context);
            },
          );
        },
      ),
    );
  }
}

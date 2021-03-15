import 'package:flutter/material.dart';
import 'input.dart';
import 'result.dart';
import 'convert.dart';
import 'history.dart';
import 'dropdown.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
// This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController etDecimal = new TextEditingController();

  int nBilangan = 0;
  String _valueFrom = "Decimal";
  String _valueTo = "Binary";
  int _result = 0;
  List<String> listViewItem = [];

  void _konversiBilangan() {
    setState(() {
      nBilangan = int.parse(etDecimal.text);
      if (_valueFrom == "Decimal") {
        if (_valueTo == "Binary") {
          int nBiner = 0;
          int i = 1;
          while (nBilangan > 0) {
            nBiner = nBiner + (nBilangan % 2) * i;
            nBilangan = (nBilangan / 2).floor();
            i = i * 10;
          }
          _result = nBiner;
        } else if (_valueTo == "Hexadecimal") {
        } else if (_valueTo == "Octal") {}
      } else if (_valueFrom == "Binary") {
        if (_valueTo == "Decimal") {
        } else if (_valueTo == "Hexadecimal") {
        } else if (_valueTo == "Octal") {}
      } else if (_valueFrom == "Hexadecimal") {
        if (_valueTo == "Binary") {
        } else if (_valueTo == "Decimal") {
        } else if (_valueTo == "Octal") {}
      } else if (_valueFrom == "Octal") {
        if (_valueTo == "Binary") {
        } else if (_valueTo == "Hexadecimal") {
        } else if (_valueTo == "Decimal") {}
      }
      listViewItem.insert(0, "$_valueTo : $_result");
    });
  }

  void dropdownOnChanged(String changeValue) {
    setState(() {
      _valueFrom = changeValue;
    });
  }

  void dropdownOnChanged2(String changeValue) {
    setState(() {
      _valueTo = changeValue;
    });
    _konversiBilangan();
  }

  var listString = [
    "Binary",
    "Decimal",
    "Hexadecimal",
    "Octal",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Bilangan"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Input(etDecimal: etDecimal),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Dari Bilangan",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Dropdown(
                listView: listString,
                newValue: _valueFrom,
                newMethod: dropdownOnChanged,
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Konversi ke Bilangan",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Dropdown(
                listView: listString,
                newValue: _valueTo,
                newMethod: dropdownOnChanged2,
              ),
              Result(
                result: _result,
              ),
              Convert(konvertHandler: _konversiBilangan),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Riwayat Konversi",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded(
                child: RiwayatKonversi(listViewItem: listViewItem),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

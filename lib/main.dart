import 'package:flutter/material.dart';
import 'package:stocky/screens/createstock.dart';
import 'package:stocky/screens/stock.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StockPageState(),
      routes: <String, WidgetBuilder>{
        '/createstock': (BuildContext context) => CreateStock(),
      },
    );
  }
}

class Stock extends StatefulWidget {
  @override
  StockState createState() => StockState();
}

class StockState extends State<Stock> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder();
  }
}

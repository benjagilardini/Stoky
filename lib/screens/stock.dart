import 'package:flutter/material.dart';
import 'package:stocky/screens/createstock.dart';

class StockPageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Stocky'),
            ),
            body: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.map),
                  title: Text('Map'),
                ),
                ListTile(
                  leading: Icon(Icons.map),
                  title: Text('Map'),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/createstock');
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.amber,
            )));
  }
}

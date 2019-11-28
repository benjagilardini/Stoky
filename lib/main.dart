import 'package:flutter/material.dart';
import 'package:stocky/screens/stock.dart';
import 'package:stocky/inherited.dart';

void main() => runApp(MiApp());

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StockedContainer(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Stocky',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: PaginaVisualizacion(),
      ),
    );
  }
}

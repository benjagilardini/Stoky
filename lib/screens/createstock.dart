import 'package:stocky/screens/stock.dart';
import 'package:flutter/material.dart';
import 'package:stocky/inherited.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:convert' as JSON;

class PaginaCreacion extends StatefulWidget {
  PaginaCreacion({Key key}) : super(key: key);

  @override
  _PaginaCreaciState createState() => _PaginaCreaciState();
}

class _PaginaCreaciState extends State<PaginaCreacion> {
  final myController = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  bool _validate = false;
  bool _validate2 = false;
  bool _validate3 = false;

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  _addStock() async {
    var response = await http.post('http://10.0.2.2:8000/apistock/stock/',
        headers: {"Content-Type": "application/json"},
        body: JSON.jsonEncode({
          "nombre": myController.text,
          "descripcion": myController2.text,
          "cantidad": myController3.text,
        }));

    if (response.statusCode == 201) {
      Navigator.of(context).pop();
    }

    // Navigator.push(context, MaterialPageRoute(builder: (context) => PaginaVisualizacion()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agregar"),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextField(
                  controller: myController,
                  maxLength: 10,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Ingresar titutlo',
                    errorText: _validate ? 'Debes ingresar un texto' : null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                ),
                TextField(
                  controller: myController2,
                  maxLength: 30,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Ingresar descripcion',
                    errorText: _validate2 ? 'Debes ingresar un texto' : null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: myController3,
                  maxLength: 3,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Ingresar cantidad',
                    errorText: _validate3 ? 'Debes ingresar un numero' : null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: MaterialButton(
                    child: Text(
                      'Guardar',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.blue,
                    onPressed: () {
                      setState(() {
                        myController.text.isEmpty
                            ? _validate = true
                            : _validate = false;
                        myController2.text.isEmpty
                            ? _validate2 = true
                            : _validate2 = false;
                        myController3.text.isEmpty
                            ? _validate3 = true
                            : _validate3 = false;
                      });
                      _addStock();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

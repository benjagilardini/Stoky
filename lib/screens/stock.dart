import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:stocky/screens/createstock.dart';
import 'package:stocky/inherited.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PaginaVisualizacion extends StatefulWidget {
  PaginaVisualizacion({Key key}) : super(key: key);

  @override
  _PaginaVisualState createState() => _PaginaVisualState();
}

class _PaginaVisualState extends State<PaginaVisualizacion> {
  var stocklist = <Stocked>[];

  getJsonData() async {
    var response = await http.get('http://172.20.10.3:8080/apistock/stock/');
    print(response.body);

    setState(() {
      stocklist.clear();
      json
          .decode(response.body)
          .forEach((el) => stocklist.add(new Stocked.fromJson(el)));
    });
  }

  _makeDeleteRequest(int id) async {
    await http.delete(
        'http://172.20.10.3:8080/apistock/stock/' + id.toString() + '/');
    stocklist.removeWhere((item) => item.id == id);
    setState(() {});
  }

  @override
  void initState() {
    getJsonData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stocky"),
        actions: <Widget>[
          new IconButton(
              icon: const Icon(Icons.refresh),
              tooltip: 'Refresh',
              onPressed: () {
                getJsonData();
              }),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  color: Colors.black,
                ),
                itemCount: stocklist.length,
                itemBuilder: (BuildContext context, int i) {
                  if (stocklist.isEmpty) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Container(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          CircleAvatar(
                            child: Text(stocklist[i].cantidad.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(stocklist[i].nombre,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                ],
                              ),
                              Container(
                                width: 240,
                                child: Text(stocklist[i].descripcion),
                              )
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              _makeDeleteRequest(stocklist[i].id);
                            },
                            color: Colors.blue,
                            icon: Icon(Icons.delete_outline),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PaginaCreacion()),
          );
        },
        tooltip: 'Agregar',
        child: Icon(Icons.add),
      ),
    );
  }
}

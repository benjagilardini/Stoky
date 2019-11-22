import 'package:flutter/material.dart';
import 'package:stocky/screens/createstock.dart';
import 'package:stocky/inherited.dart';

class PaginaVisualizacion extends StatefulWidget {
  PaginaVisualizacion({Key key}) : super(key: key);

  @override
  _PaginaVisualState createState() => _PaginaVisualState();
}

class _PaginaVisualState extends State<PaginaVisualizacion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stocky"),
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
                    itemCount: StockedInherited.of(context).stockedArray.length,
                    itemBuilder: (BuildContext context, int i) {
                      return Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                        StockedInherited.of(context)
                                            .stockedArray[i]
                                            .cantidad,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)),
                                    Text(
                                        ' | ' +
                                            StockedInherited.of(context)
                                                .stockedArray[i]
                                                .nombre,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)),
                                  ],
                                ),
                                Container(
                                  width: 280,
                                  child: Text(StockedInherited.of(context)
                                      .stockedArray[i]
                                      .descripcion),
                                )
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                StockedInherited.of(context).deleteStocked(i);
                              },
                              color: Colors.blue,
                              icon: Icon(Icons.delete_outline),
                            ),
                          ],
                        ),
                      );
                    })),
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

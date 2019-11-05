import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Stocky',

      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      
      home: MyHomePage(title: 'Crear stock'),
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
    

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.map),
              title: Text('Map'),
            ),
            ListTile(
              leading: Icon(Icons.map),
              title: Text('hola'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateItem()),
            );
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.amber,
        ),
      ),
    );
    }
}
class CreateItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crear un item"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                hintText: 'Nombre del item'
                ),
               ),
               TextField(
                decoration: InputDecoration(
                hintText: 'Descripcion'
                ),
               ),
               const SizedBox(height: 30),
                RaisedButton(
                onPressed: () {
                },
                child: const Text(
                  'Agregar',
                  style: TextStyle(fontSize: 20)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

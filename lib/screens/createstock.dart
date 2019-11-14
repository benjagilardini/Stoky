import 'package:flutter/material.dart';

class CreateStock extends StatelessWidget {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
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
                controller: _nameController,
                decoration: InputDecoration(hintText: 'Nombre'),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              ),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(hintText: 'Descripcion'),
              ),
              buildBtnSubmit()
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildBtnSubmit() {
  return Padding(
    padding: EdgeInsets.all(15),
    child: SizedBox(
      width: 200,
      height: 50,
      child: RaisedButton(
        color: Colors.green,
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () {},
        child: Text(
          'Generar Producto',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    ),
  );
}

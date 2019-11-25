import 'package:flutter/material.dart';

class StockedContainer extends StatefulWidget {
  StockedContainer({Key key, this.child}) : super(key: key);
  final Widget child;

  _StockedContainerState createState() => _StockedContainerState();
}

class _StockedContainerState extends State<StockedContainer> {
  var stockedArray = <Stocked>[];

  void addStocked(Stocked s) {
    setState(() {
      stockedArray.add(s);
    });
  }

  void deleteStocked(int posicion) {
    setState(() {
      stockedArray.removeAt(posicion);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StockedInherited(
      this.stockedArray,
      this.addStocked,
      this.deleteStocked,
      child: this.widget.child,
    );
  }
}

class StockedInherited extends InheritedWidget {
  StockedInherited(this.stockedArray, this.addStocked, this.deleteStocked,
      {Key key, this.child})
      : super(key: key, child: child);

  final Widget child;
  final List<Stocked> stockedArray;
  final ValueChanged<Stocked> addStocked;
  final ValueSetter<int> deleteStocked;

  static StockedInherited of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(StockedInherited)
        as StockedInherited);
  }

  @override
  bool updateShouldNotify(StockedInherited oldWidget) {
    return true;
  }
}

class Stocked {
  int id;
  String nombre;
  String descripcion;
  int cantidad;

  Stocked(this.nombre, this.descripcion, this.cantidad);

  Stocked.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    descripcion = json['descripcion'];
    cantidad = json['cantidad'];
  }

   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nombre'] = this.nombre;
    data['descripcion'] = this.descripcion;
    data['cantidad'] = this.cantidad;
    return data;
  }
}

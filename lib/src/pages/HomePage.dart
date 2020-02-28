import 'package:flutter/material.dart';
import 'package:preferenciasusuario/src/SharePrefs/PreferenciasUsuario.dart';
import 'package:preferenciasusuario/src/widgets/Menu.dart';

class HomePage extends StatelessWidget {

  static final String routeName = "home";
  final prefs = PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {

    //Guarda la pagina en preferencias
    prefs.pagina = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
        title: Text("Preferencias de usuario"),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      //Menu lateral
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Color secundario: ${prefs.colorSecundario}"),
          Divider(),
          Text("Genero: ${prefs.genero}"),
          Divider(),
          Text("Nombre de usuario: ${prefs.nombre}"),
          Divider(),
        ],
      ),
    );
  }
}
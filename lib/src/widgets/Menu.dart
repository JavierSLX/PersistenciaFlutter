import 'package:flutter/material.dart';
import 'package:preferenciasusuario/src/pages/HomePage.dart';
import 'package:preferenciasusuario/src/pages/SettingsPage.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          //Crea una cabecera del menu
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/geometria.jpg"),
                fit: BoxFit.cover
              )
            ),
          ),
          //Las opciones del menú
          ListTile(
            leading: Icon(Icons.home, color: Colors.blue),
            title: Text("Home"),
            onTap: ()=>Navigator.pushReplacementNamed(context, HomePage.routeName),
          ),
          ListTile(
            leading: Icon(Icons.party_mode, color: Colors.blue),
            title: Text("Party Mode"),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.people, color: Colors.blue),
            title: Text("People"),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.blue),
            title: Text("Settings"),
            onTap: () {
              //Cierra el menu y manda a la pagina de settings (Quita la flecha de regreso con esta opcion)
              //Navigator.pop(context);
              Navigator.pushReplacementNamed(context, SettingsPage.routeName);
              }
          ),
        ],
      ),
    );
  }
}
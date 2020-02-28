import 'package:flutter/material.dart';
import 'package:preferenciasusuario/src/SharePrefs/PreferenciasUsuario.dart';
import 'package:preferenciasusuario/src/widgets/Menu.dart';

class SettingsPage extends StatefulWidget {

  static final String routeName = "settings";

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool colorSecundario;
  int genero;
  String nombre = "Pedro";

  TextEditingController textController;

  //Instancia de preferencias
  final prefs = PreferenciasUsuario();

  //Se inicializa el controller al inicio del ciclo de vida de la página
  @override
  void initState() {
    super.initState();

    //Guarda la pagina en preferencias
    prefs.pagina = SettingsPage.routeName;

    //Carga los datos persistentes
    genero = prefs.genero;
    colorSecundario = prefs.colorSecundario;
    nombre = prefs.nombre;
    textController = new TextEditingController(text: nombre);
  }

  setSelectedRadio(int valor)
  {
    //Guarda los datos en preferencias
    prefs.genero = valor;
    genero = valor;

    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajustes"),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      //Menu
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            child: Text("Settings", style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),),
          ),
          Divider(),
          SwitchListTile(
            value: colorSecundario,
            title: Text("Color secundario"),
            onChanged: (bool value){
              setState(() {
                colorSecundario = value;

                //Guarda en preferencias
                prefs.colorSecundario = value;
              });
            },
          ),
          RadioListTile(
            value: 1,
            title: Text("Masculino"),
            groupValue: genero,
            onChanged: setSelectedRadio
          ),
          RadioListTile(
            value: 2,
            title: Text("Femenino"),
            groupValue: genero,
            onChanged: setSelectedRadio
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                labelText: "Nombre",
                helperText: "Nombre de la persona usando el teléfono",
              ),
              onChanged: (String value){
                //Guarda en preferencias
                prefs.nombre = value;
              },
            ),
          )
        ],
      )
    );
  }
}
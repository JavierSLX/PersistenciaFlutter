import 'package:flutter/material.dart';
import 'package:preferenciasusuario/src/SharePrefs/PreferenciasUsuario.dart';
import 'package:preferenciasusuario/src/pages/HomePage.dart';
import 'package:preferenciasusuario/src/pages/SettingsPage.dart';
 
void main() async
{
  //Arranca la instancia de las preferencias antes de la app
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final prefs = new PreferenciasUsuario();

    return MaterialApp(
      title: 'Preferencias',
      initialRoute: prefs.pagina,
      routes: {
        HomePage.routeName: (BuildContext context) => HomePage(),
        SettingsPage.routeName: (BuildContext context) => SettingsPage(),
      },
    );
  }
}
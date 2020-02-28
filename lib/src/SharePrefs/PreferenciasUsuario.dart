
import 'package:preferenciasusuario/src/pages/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario
{
  //Patron Singleton
  static final PreferenciasUsuario _instancia = PreferenciasUsuario._internal();

  factory PreferenciasUsuario()
  {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences prefs;

  //Instancia las preferencias
  initPrefs() async 
  {
    this.prefs = await SharedPreferences.getInstance();
  }

  //GET y SET de las propiedades
  get genero
  {
    return prefs.getInt("genero") ?? 1;
  }

  set genero(int value)
  {
    prefs.setInt("genero", value);
  }

  get colorSecundario
  {
    return prefs.getBool("colorSecundario") ?? false;
  }

  set colorSecundario(bool value)
  {
    prefs.setBool("colorSecundario", value);
  }

  get nombre
  {
    return prefs.getString("nombre") ?? "";
  }

  set nombre(String value)
  {
    prefs.setString("nombre", value);
  }

  get pagina
  {
    return prefs.getString("pagina") ?? HomePage.routeName;
  }

  set pagina(String value)
  {
    prefs.setString("pagina", value);
  }
}
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_sigpe/models/usuario/usuario_model.dart';

class SeguridadProvider extends ChangeNotifier {
  Usuario? _usuario;
  bool _isLoading = false;

  static const restApiUrl = String.fromEnvironment('REST_API_SEGURIDAD');

  Usuario? get usuario => _usuario;

  loginUsuarioInterno(String usuario, String password) async {
    // ignore: unused_local_variable
    final response = await http.get(
      Uri.parse('${restApiUrl}personas/soporte').replace(queryParameters: {
        'usuario': usuario,
        'password': password,
      }),
      headers: {'Content-Type': 'application/json'},
    );
    // * retorna el resultado...
    return response;
  }

  // * Cerrar sesión
  void logout() {
    _usuario = null;
    notifyListeners();
  }
}

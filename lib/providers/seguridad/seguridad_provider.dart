import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'package:flutter_sigpe/models/usuario/usuario_model.dart';
import 'package:flutter_sigpe/providers/comun/generic_http_provider.dart';

import 'package:flutter_sigpe/providers/comun/urilitarios_seguridad_provider.dart';

class SeguridadProvider extends ChangeNotifier {
  SeguridadProvider({required GenericHttpProvider genericHttpProvider})
      : _genericHttpProvider = genericHttpProvider;
  final GenericHttpProvider _genericHttpProvider;

  Usuario? _usuario;
  final bool _isLoading = false;

  static const restApiUrl = String.fromEnvironment('REST_API_SEGURIDAD');

  Usuario? get usuario => _usuario;

  loginUsuarioInterno(String usuario, String password) async {
    try {
      // * codificando las variables...
      var usuarioCod = UtilitariosSeguridadProvider.codificar(usuario);
      var passwordCod = UtilitariosSeguridadProvider.codificar(password);
      // * retorna consulta...
      return _genericHttpProvider.post('${restApiUrl}autenticaciones/ingreso',
          jsonEncode({"usuario": usuarioCod, "password": passwordCod}));
    } catch (e) {
      rethrow;
    }
  }

  // * Cerrar sesión
  void logout() {
    _usuario = null;
    notifyListeners();
  }
}

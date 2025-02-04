import 'package:flutter/foundation.dart';

import 'package:flutter_sigpe/models/usuario/usuario_model.dart';

import 'package:flutter_sigpe/services/seguridad/seguridad_service.dart';

class SeguridadProvider extends ChangeNotifier {
  final SeguridadService _seguridadService;
  bool _isLoading = false;

  Usuario? _usuario;
  Usuario? get usuario => _usuario;

  SeguridadProvider(this._seguridadService);

  Future<bool> loginUsuarioInterno(String usuario, String password) async {
    _isLoading = true;
    notifyListeners(); // Update UI
    try {
      final respuesta = true;
      // * verifica login interno...
      final response = _seguridadService.loginUsuarioInterno(usuario, password);
      // * verifia si  todo ha ido bien...
      if (response.statusCode == 200) {
        // * almacena el token...
        // * recupera los perfiles de permiso...
        // * almacena los perfiles...
      }

      // * inactiva al roller del botón...
      _isLoading = false;
      // * notifiaca a los usuario...
      notifyListeners();
      return respuesta;
    } catch (e) {
      rethrow;
    }
  }

  almacenData() {
    try {} catch (e) {
      rethrow;
    }
  }

  // * Cerrar sesión
  void logout() {
    _usuario = null;
    notifyListeners();
  }
}

import 'package:flutter/foundation.dart';

import 'package:flutter_sigpe/models/usuario/usuario_model.dart';

import 'package:flutter_sigpe/services/seguridad/seguridad_service.dart';
import 'package:flutter_sigpe/services/utilitarios/utilitarios_storage_service.dart';

class SeguridadProvider extends ChangeNotifier {
  final SeguridadService _seguridadService;
  bool _isLoggedIn = false;
  bool _isLoading = false;
  String? _errorMessage;
  static const tokenName = String.fromEnvironment('TOKEN_KEY');

  Usuario? _usuario;
  Usuario? get usuario => _usuario;
  bool get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  SeguridadProvider(this._seguridadService) {
    verificaLoginEstado();
  }

  Future<void> verificaLoginEstado() async {
    final token = await UtilitariosStorageService.retornar(tokenName);
    _isLoggedIn = token != null;
    notifyListeners();
  }

  Future<dynamic> loginUsuarioInterno(String usuario, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try {
      // * verifica login interno...
      final respuesta =
          _seguridadService.loginUsuarioInterno(usuario, password);
      // * inactiva al roller del botón...
      _isLoading = false;
      // * notifiaca a los usuario...
      notifyListeners();
      // * retorna información...
      return respuesta;
    } catch (e) {
      rethrow;
    }
  }

  // * Cerrar sesión
  void logout() {
    // * objeto null...
    _usuario = null;
    // * eliminando token...
    _seguridadService.logout();
    // * notificación de cambio...
    notifyListeners();
  }
}

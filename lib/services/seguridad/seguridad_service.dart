import 'dart:convert';

import 'package:flutter_sigpe/interfaces/comun/login_interno.abstract.dart';
import 'package:flutter_sigpe/models/comun/usuario_login.dart';
import 'package:flutter_sigpe/models/usuario/usuario_model.dart';
import 'package:flutter_sigpe/services/comun/generic_http_service.dart';

import 'package:flutter_sigpe/providers/comun/urilitarios_seguridad_provider.dart';
import 'package:flutter_sigpe/services/utilitarios/utilitarios_storage_service.dart';

class SeguridadService {
  final GenericHttpService _genericHttpService;
  Usuario? _usuario;

  SeguridadService({required GenericHttpService genericHttpService})
      : _genericHttpService = genericHttpService;

  static const restApiUrl = String.fromEnvironment('REST_API_SEGURIDAD');
  static const tokenName = String.fromEnvironment('TOKEN_KEY');

  Usuario? get usuario => _usuario;

  _procesaInformacion<bool>(respuesta) async {
    // * recoge el token generado...
    final token = jsonDecode(respuesta.body)[tokenName];
    // * almacena en el storage...
    await UtilitariosStorageService.almacenar(tokenName, token);
    // * recuperamos los perfiles...
    // * retorno true...
    return true;
  }

  Future<dynamic> loginUsuarioInterno(UserLogin userLogin) async {
    try {
      // * codificando las variables...
      var usuarioCod =
          UtilitariosSeguridadProvider.codificar(userLogin.usuario);
      var passwordCod =
          UtilitariosSeguridadProvider.codificar(userLogin.password);
      // * retorna consulta...
      final respuesta = await _genericHttpService.post(
          '${restApiUrl}autenticaciones/ingreso',
          jsonEncode({"usuario": usuarioCod, "password": passwordCod}));
      // * si todo está ok, retorna true...
      if (respuesta.statusCode == 200) return _procesaInformacion(respuesta);
      // * hubo error, retorna false...
      return false;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    UtilitariosStorageService.eliminar(tokenName);
  }
}

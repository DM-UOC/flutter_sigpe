import 'dart:io';
import 'dart:convert';
import 'package:flutter_sigpe/services/comun/exception_service.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_sigpe/interfaces/oersistencia/post_persistencia_abstract.dart';
import 'package:flutter_sigpe/interfaces/oersistencia/get_persistencia_abstract.dart';

class GenericHttpService<O, R> implements IGetPersistencia, IPostPersistencia {
  static const headers = {'Content-Type': 'application/json'};

  @override
  Future retornaPorId(objeto) {
    // TODO: implement retornaPorId
    throw UnimplementedError();
  }

  @override
  Future<List> retornar() {
    // TODO: implement retornar
    throw UnimplementedError();
  }

  @override
  Future<List> retornarPorId(objeto) {
    // TODO: implement retornarPorId
    throw UnimplementedError();
  }

  @override
  Future post(String recurso, body) async {
    // TODO: implement post
    final respuesta = await _generaConsulta(
        http.post(Uri.parse(recurso), headers: headers, body: body));
    // * envia el mensakje para ser procesado...
    return _procesaRespuesta(respuesta);
  }

  Future _generaConsulta<V>(V httpCliente) async {
    try {
      // TODO: implement post
      return httpCliente;
    } on http.ClientException catch (e) {
      // Handle HTTP-specific errors (e.g., connection timeout)
      throw Exception('Network error: ${e.toString()}');
    } on SocketException catch (e) {
      // Handle no internet connection
      throw Exception('No internet connection: ${e.toString()}');
    } catch (e) {
      throw Exception('Failed to load data: ${e.toString()}');
    }
  }

  Map<String, dynamic> _procesaRespuesta(http.Response respuesta) {
    // * transforma la data a formato json...
    final data = jsonDecode(respuesta.body);
    // * respuesta ok...
    if (respuesta.statusCode >= 200 && respuesta.statusCode < 300) {
      // * retorna data...
      return data;
    } else {
      // * procesa error...
      throw ApiException(
        statusCode: respuesta.statusCode,
        message: data['message'] ?? 'Error interno del servidor',
      );
    }
  }
}

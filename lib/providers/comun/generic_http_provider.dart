import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter_sigpe/interfaces/oersistencia/post_persistencia_abstract.dart';
import 'package:flutter_sigpe/interfaces/oersistencia/get_persistencia_abstract.dart';

class GenericHttpProvider<O, R> implements IGetPersistencia, IPostPersistencia {
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
    try {
      // TODO: implement post
      return await _generaConsulta(http.post(Uri.parse(recurso),
          headers: {'Content-Type': 'application/json'}, body: body));
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future _generaConsulta<V>(V verbo) async {
    try {
      // TODO: implement post
      return verbo;
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
}

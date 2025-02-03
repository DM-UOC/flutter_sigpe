import 'package:flutter/foundation.dart';
import 'dart:convert';

class UtilitariosSeguridadProvider extends ChangeNotifier {
  static codificar(String cadena) {
    List<int> utf8Bytes = utf8.encode(cadena);
    return base64Encode(utf8Bytes);
  }
}

import 'package:flutter/foundation.dart';
import 'dart:convert';

class UtilitariosProvider extends ChangeNotifier {
  static _retornaJSONDecode(valorTransformar) {
    return jsonDecode(valorTransformar);
  }
}

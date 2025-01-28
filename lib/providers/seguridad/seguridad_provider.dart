import 'package:flutter/foundation.dart';

class SeguridadProvider extends ChangeNotifier {
  int _count = 0;

  // Getter para acceder al valor
  int get count => _count;

  // Método para incrementar el contador
  void increment() {
    _count++;
    notifyListeners(); // Notifica a los listeners para reconstruir widgets
  }

  // Método para reiniciar el contador
  void reset() {
    _count = 0;
    notifyListeners();
  }
}

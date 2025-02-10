import 'package:flutter_sigpe/interfaces/comun/login_interno.abstract.dart';

class UserLogin implements ILoginInterno {
  @override
  String password;

  @override
  String usuario;

  UserLogin({required this.usuario, required this.password});
}

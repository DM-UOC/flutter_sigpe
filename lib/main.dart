import 'package:flutter/material.dart';

import 'package:flutter_sigpe/vistas/comun/login_screen.dart';

void main() => runApp(const AppSigpe());

// * fstless -> snipet que permite crear una clase dinámica...
class AppSigpe extends StatelessWidget {
  const AppSigpe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Sigpe VF",
      home: const LoginScreen(),
    ); // * BarraPrincipal());
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_sigpe/vistas/comun/home_screen.dart';
import 'package:flutter_sigpe/vistas/comun/login_screen.dart';

import 'package:flutter_sigpe/providers/seguridad/seguridad_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => SeguridadProvider())],
      child: const AppSigpe(),
    ),
  );
}

// * fstless -> snipet que permite crear una clase dinámica...
class AppSigpe extends StatelessWidget {
  const AppSigpe({super.key});

  @override
  Widget build(BuildContext context) {
    final seguridadProvider = context.watch<SeguridadProvider>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Sigpe V3",
      home: seguridadProvider.usuario != null
          ? const HomeScreen()
          : const LoginScreen(),
    ); // * BarraPrincipal());
  }
}

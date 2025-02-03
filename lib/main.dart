import 'package:flutter/material.dart';
import 'package:flutter_sigpe/providers/comun/generic_http_provider.dart';
import 'package:provider/provider.dart';

import 'package:flutter_sigpe/views/comun/home_screen.dart';
import 'package:flutter_sigpe/views/comun/login_screen.dart';

import 'package:flutter_sigpe/providers/seguridad/seguridad_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<GenericHttpProvider>(
          create: (context) => GenericHttpProvider(),
        ),
        ChangeNotifierProvider(
            create: (context) => SeguridadProvider(
                  genericHttpProvider: context.read(),
                ))
      ],
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

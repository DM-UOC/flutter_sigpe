import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_sigpe/providers/seguridad/seguridad_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final seguridadProvider = context.watch<SeguridadProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => seguridadProvider.logout(),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nombre: ${seguridadProvider.usuario!.nombre}'),
          ],
        ),
      ),
    );
  }
}

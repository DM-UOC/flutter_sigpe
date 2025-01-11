import 'package:flutter/material.dart';
import 'package:flutter_sigpe/vistas/comun/home.dart';

void main() => runApp(const AppSigpe());

// * fstless -> snipet que permite crear una clase dinámica...
class AppSigpe extends StatelessWidget {
  const AppSigpe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "APP Sigpe Flutter",
        home: BarraPrincipal());
  }
}

class BarraPrincipal extends StatelessWidget {
  const BarraPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.orange,
              title: Text(
                'Barra Principal',
                style: TextStyle(color: Colors.white),
              ),
              bottom: TabBar(
                  indicatorColor: Colors.white,
                  labelColor: Colors.white,
                  tabs: [
                    Tab(
                      icon: Icon(Icons.home),
                      text: "Principal",
                    )
                  ]),
            ),
            body: TabBarView(children: [HomeView()])));
  }
}

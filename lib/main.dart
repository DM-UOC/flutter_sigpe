import 'package:flutter/material.dart';

void main() => runApp(const AppSigpe());

// * fstless -> snipet que permite crear una clase dinámica...
class AppSigpe extends StatelessWidget {
  const AppSigpe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "APP SIgpe Flutter",
        home: BarraPrincipal());
  }
}

class BarraPrincipal extends StatelessWidget {
  const BarraPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Barra Principal',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: Card(
          child: Row(
            children: <Widget>[
              Container(
                height: 125,
                width: 100,
                child: ClipRRect(borderRadius: BorderRadius.circular(10)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

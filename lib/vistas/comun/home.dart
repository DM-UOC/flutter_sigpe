import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[_RetornaListado(context), _RetornaListado(context)],
    ));
  }

  /// * Widget
  /// TODO: Método que será dinámico para retornar un listado...
  Widget _RetornaListado(BuildContext buildContext) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: MediaQuery.of(buildContext).size.width,
          height: 125,
          child: Card(
            child: Row(
              children: <Widget>[
                SizedBox(
                  height: 125,
                  width: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                        'https://static.platzi.com/media/teachers/alison-jimenez-flutter_1_1_1.png'),
                  ),
                ),
                SizedBox(
                  width: 26,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Lasagna',
                      style: TextStyle(fontSize: 16, fontFamily: "Quicksand"),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      height: 2,
                      width: 75,
                      color: Colors.orange,
                    ),
                    Text(
                      "DM",
                      style: TextStyle(fontSize: 16, fontFamily: "Quicksand"),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

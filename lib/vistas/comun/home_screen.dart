import 'package:flutter/material.dart';

// * referencia al paquete http...
import 'package:http/http.dart' as http;
// * referenia a la librería jsonDecode...
import 'dart:convert';

import 'package:flutter_sigpe/vistas/detalle/detalle_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          _RecipesCard(context),
          _RecipesCard(context),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            _showBottom(context);
          }),
    );
  }

/**
 * Por el momento se declara el tipo lista que retorna elementos dinamicos...
 * posteriormete se actualizará el método para que devuelva el elemento requerido o su tipo exacto...
 *  */
  Future<List<dynamic>> fetchRecipes() async {
    // Android 10.0.2.2
    // IOS 127.0.0.1
    // WEB
    final url = Uri.parse(
        'http://10.4.1.95:3005/api-seg/personas/soporte?usuario=martinezd&password=_31di3**mAr74_');
    final response = await http.get(url);
    final data = jsonDecode(response.body);
    return data['recipes'];
  }

  Future<void> _showBottom(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (contexto) => Container(
              width: MediaQuery.of(context)
                  .size
                  .width, // * permite dar el ancho de la pantalla...
              height: 500,
              color: Colors.white,
              child: RecipeForm(),
            ));
  }

  /// * Widget
  /// TODO: Método que será dinámico para retornar un listado...
  Widget _RecipesCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DetalleView(context, recipeName: "Lasagna")));
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
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
                    'https://static.platzi.com/media/teachers/alison-jimenez-flutter_1_1_1.png',
                    fit: BoxFit.cover,
                  ),
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
                    style: TextStyle(fontSize: 16, fontFamily: 'Quicksand'),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    height: 2,
                    width: 75,
                    color: Colors.orange,
                  ),
                  Text('Alison Jiménez',
                      style: TextStyle(fontSize: 16, fontFamily: 'Quicksand')),
                  SizedBox(
                    height: 4,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

/// TODO: Clase de tipo formulario - statica
class RecipeForm extends StatelessWidget {
  const RecipeForm({super.key});

  @override
  Widget build(BuildContext context) {
    // * variable global...
    // * servirá como validador...
    final formKey = GlobalKey<FormState>();
    // * variable de control de formulario que guarda su estado...
    final TextEditingController textEditingControllerNombre =
        TextEditingController();
    final TextEditingController textEditingControllerAutor =
        TextEditingController();
    final TextEditingController textEditingControllerUrl =
        TextEditingController();
    final TextEditingController textEditingControllerReceta =
        TextEditingController();
    return Padding(
        padding: EdgeInsets.all(8),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment
                .start, // * alineación verifical - iniciando desde el principio
            children: [
              Text(
                'Add New Recipe',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              _buildTextField(
                  textEditingController: textEditingControllerNombre,
                  labelEtiqueta: 'Nombre',
                  validator: (valor) {
                    // * verifica si no existe datos...
                    if (valor == null || valor.isEmpty) {
                      return "Ingrese un nombre de la receta";
                    }
                    // * todo bien retorna null
                    return null;
                  }),
              SizedBox(
                height: 16,
              ),
              _buildTextField(
                  textEditingController: textEditingControllerAutor,
                  labelEtiqueta: 'Autor',
                  validator: (valor) {
                    // * verifica si no existe datos...
                    if (valor == null || valor.isEmpty) {
                      return "Ingrese nombre de autor";
                    }
                    // * todo bien retorna null
                    return null;
                  }),
              SizedBox(
                height: 16,
              ),
              _buildTextField(
                  textEditingController: textEditingControllerUrl,
                  labelEtiqueta: 'Url imagen',
                  validator: (valor) {
                    // * verifica si no existe datos...
                    if (valor == null || valor.isEmpty) {
                      return "Ingrese la url de la imagen";
                    }
                    // * todo bien retorna null
                    return null;
                  }),
              SizedBox(
                height: 16,
              ),
              _buildTextField(
                  maxLines: 4,
                  textEditingController: textEditingControllerReceta,
                  labelEtiqueta: 'Receta',
                  validator: (valor) {
                    // * verifica si no existe datos...
                    if (valor == null || valor.isEmpty) {
                      return "Ingrese un nombre de la receta";
                    }
                    // * todo bien retorna null
                    return null;
                  }),
              SizedBox(
                height: 16,
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        //Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text(
                      'Guardar',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )),
              )
            ],
          ),
        ));
  }

  Widget _buildTextField(
      {required TextEditingController textEditingController,
      required String labelEtiqueta,
      required String? Function(String?) validator,
      int maxLines = 1}) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: labelEtiqueta,
          labelStyle: TextStyle(
            fontFamily: 'Quicksand',
            color: Colors.orange,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange, width: 1),
              borderRadius: BorderRadius.circular(10))),
      validator: validator,
      maxLines: maxLines,
    );
  }
}

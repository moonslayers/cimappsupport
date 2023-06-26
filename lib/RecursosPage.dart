import 'package:flutter/material.dart';
import 'routes.dart';
import 'Menu_drawer.dart';

class RecursosPage extends StatelessWidget{
  const RecursosPage({super.key});

  @override
  Widget build(BuildContext context) {
    ArticuloWidget example=const ArticuloWidget(imagen: 'https://img.bekiapsicologia.com/articulos/portada/71000/71356-h.jpg',
        titulo: '¿Como ser mejor persona?',
        descripcion: 'Este es un contenido de prueba muy interesante el cual te puede ayudar'
            ' es un contenido de prueba claramente, por favor presiona en leer para saber más.'
            ' Si no me crees deberias intentarlo no crees?',
        fecha: '05/04/23');

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter layout demo',
      routes: routes, //rutas en archivo routes.dart
      home: Scaffold(
        appBar: AppBar(
          backgroundColor:const Color(0xFF00723F),
          title: const Text(
            'Recursos',
            style: TextStyle(
              color: Color(0xFFDD971A), // Aquí se puede poner el color hexadecimal deseado
            ),
          ),
        ),
        //aqui empieza el menu lateral
        drawer: const Menu_drawer(),
        //aqui empieza el body
        body: ListView(
          children: [
            example,
          ],
        ),
      ),
    );
  }
}

class ArticuloWidget extends StatelessWidget {
  final String imagen;
  final String titulo;
  final String descripcion;
  final String fecha;

  const ArticuloWidget({
    Key? key,
    required this.imagen,
    required this.titulo,
    required this.descripcion,
    required this.fecha,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0), // establecer el margen deseado aquí
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    image: NetworkImage(imagen),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  fecha,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  titulo,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  descripcion,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00723F), // Color de fondo
                      ),
                      child:const Text("Leer",
                      style: TextStyle(color: Color(0xFFDD971A)),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite_border),
                      color: const Color(0xFFDD971A),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'routes.dart';
import 'Menu_drawer.dart';

class MenuPage extends StatelessWidget{
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter layout demo',
      routes: routes, //rutas en archivo routes.dart
      home: Scaffold(
        appBar: AppBar(
          backgroundColor:const Color(0xFF00723F),
          title: const Text(
            'CimaApp',
            style: TextStyle(
              color: Color(0xFFDD971A), // Aquí se puede poner el color hexadecimal deseado
            ),
          ),
        ),
        //aqui empieza el menu lateral
        drawer: const Menu_drawer(),
        //aqui empieza el body
        body: ListView(
          children:const [
            Text('Mensaje prueba'),
          ],
        ),
      ),
    );
  }
  
  
}
import 'package:flutter/material.dart';
import 'routes.dart';
import 'Menu_drawer.dart';
import 'quizzes/QuizzBeck.dart';

class QuizzPage extends StatelessWidget{
  const QuizzPage({super.key});

  @override
  Widget build(BuildContext context) {
    Quizz examplequizz= Quizz(
      title: 'Como me siento hoy?',
      content: 'Comparte tus sentimientos como nosostros con este intuitivo test',
      imageUrl: 'https://s3.amazonaws.com/s3.timetoast.com/public/uploads/photos/5685167/TITULO.jpg',
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const QuizzBeck(),
          ),
        );
      },
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter layout demo',
      routes: routes, //rutas en archivo routes.dart
      home: Scaffold(
        appBar: AppBar(
          backgroundColor:const Color(0xFF00723F),
          title: const Text(
            'Quizzes',
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
            examplequizz,
            examplequizz,
          ],
        ),
      ),
    );
  }


}

class Quizz extends StatelessWidget {
  final String title;
  final String content;
  final String imageUrl;
  final VoidCallback onPressed;

  Quizz({
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            content,
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 16.0),
          Image.network(
            imageUrl,
            fit: BoxFit.scaleDown,
            height: 250,
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
            child: const Text('Realiza quizz ahora'),
          ),

        ],
      ),
    );
  }
}
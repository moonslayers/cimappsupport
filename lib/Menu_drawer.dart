import 'package:flutter/material.dart';

class Menu_drawer extends StatelessWidget{
  const Menu_drawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/logo.png'),
                fit: BoxFit.cover,
              ),
              color: Color(0xFF00723F),
            ),
            child: Container(
              alignment: Alignment.center,
              color: Colors.white.withOpacity(0.8),
              margin: const EdgeInsets.only(top: 80),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: const Text(
                'Cimarrón a Cimarrón',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFDD971A),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person_add_sharp),
            title: const Text('Comunidad'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/feed');
            },
          ),
          ListTile(
            leading: const Icon(Icons.question_mark),
            title: const Text('Quizzes'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/quizz');
            },
          ),
          ListTile(
            leading: const Icon(Icons.star),
            title: const Text('Favoritos'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/favorites');
            },
          ),
          ListTile(
            leading: const Icon(Icons.note_rounded),
            title: const Text('Recursos'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/resources');
            },
          ),
          ListTile(
            leading: const Icon(Icons.schedule),
            title: const Text('Plan de actividades'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/scheduler');
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock_clock),
            title: const Text('Pomodoro'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/pomodoro');
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Contactos'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/contact');
            },
          ),
          ListTile(
            leading: const Icon(Icons.sos),
            title: const Text('Emergencias'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/sos');
            },
          ),
        ],
      ),
    );
  }
}
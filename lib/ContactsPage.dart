import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../routes.dart';
import '../Menu_drawer.dart';

class ContactsPage extends StatelessWidget{
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ContactoWidget> contactos= [
      const ContactoWidget(nombre: 'Jorge Marquez', telefono: '+526461244957', esHombre: true),
      const ContactoWidget(nombre: 'Moises Barrientos', telefono: '+526462138438', esHombre: true),
    ];


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter layout demo',
      routes: routes, //rutas en archivo routes.dart
      home: Scaffold(
        appBar: AppBar(
          backgroundColor:const Color(0xFF00723F),
          title: const Text(
            'Contactos',
            style: TextStyle(
              color: Color(0xFFDD971A), // Aquí se puede poner el color hexadecimal deseado
            ),
          ),
        ),
        //aqui empieza el menu lateral
        drawer: const Menu_drawer(),
        //aqui empieza el body
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: contactos.length,
                itemBuilder: (context, index) {
                  return contactos[index];
                },
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                // Aquí puedes agregar la lógica para agregar más actividades
              },
              backgroundColor: const Color(0xFFDD971A),
              child: Icon(Icons.add),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class ContactoWidget extends StatelessWidget {
  final String nombre;
  final String telefono;
  final bool esHombre;

  const ContactoWidget({
    Key? key,
    required this.nombre,
    required this.telefono,
    this.esHombre = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  esHombre ? Icons.person : Icons.person_outline,
                  size: 50,
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nombre,
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 10),
                  Text(
                    telefono,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    launch('tel:$telefono');
                  },
                  icon: Icon(Icons.phone),
                  iconSize: 30,
                ),
                SizedBox(height: 10),
                IconButton(
                  onPressed: () async {
                    String whatsappUrl = "whatsapp://send?phone=$telefono&text=${Uri.encodeFull('Hola, ¿cómo estás?')}";
                    try {
                      await launch(
                        whatsappUrl,
                        universalLinksOnly: false,
                      );
                    } catch (e) {
                      print("No se pudo abrir WhatsApp: $e");
                    }
                  },
                  icon: const Image(
                    image: AssetImage('images/icons/whatsapp.png'),
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
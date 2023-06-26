import 'package:flutter/material.dart';

import 'routes.dart';
import 'Menu_drawer.dart';

class SchedulerActivity extends StatelessWidget{
  const SchedulerActivity({super.key});


  @override
  Widget build(BuildContext context){
    final List<ActivitySchedulerWidget> activities = [
      ActivitySchedulerWidget(
        icon: Icons.directions_run,
        activityName: 'Correr en las mañanas',
        activityText: 'Estoy corriendo en las mañanas',
        activityDate: 'May 3, 2023',
        activityTime: '6:00 AM',
        isRecurring: 'Diario',
      ),
      ActivitySchedulerWidget(
        icon: Icons.menu_book,
        activityName: 'Estudiar para examen',
        activityText: 'tengo examen de ciberseguridad',
        activityDate: 'May 4, 2023',
        activityTime: '8:00 PM',
        isRecurring: 'false',
      ),
      ActivitySchedulerWidget(
        icon: Icons.book,
        activityName: 'Leer un libro',
        activityText: 'quiero leer un libro por mes',
        activityDate: 'May 5, 2023',
        activityTime: '2:00 PM',
        isRecurring: 'Mensualmente',
      ),
    ];


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'cimarron a cimarron',
      routes: routes,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor:const Color(0xFF00723F),
          title: const Text(
            'Plan de actividades',
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
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  return activities[index];
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
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}

class ActivitySchedulerWidget extends StatefulWidget {
  final IconData icon;
  final String activityName;
  final String activityText;
  final String activityDate;
  final String activityTime;
  final String isRecurring;

  ActivitySchedulerWidget({
    required this.icon,
    required this.activityName,
    required this.activityText,
    required this.activityDate,
    required this.activityTime,
    required this.isRecurring,
  });

  @override
  _ActivitySchedulerWidgetState createState() =>
      _ActivitySchedulerWidgetState();
}

class _ActivitySchedulerWidgetState extends State<ActivitySchedulerWidget> {
  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(
          widget.icon,
          size: 40,
        ),
        title: Text(
          widget.activityName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Text(
              'Date: ${widget.activityDate}',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 5),
            Text(
              widget.activityText,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Time: ${widget.activityTime}',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 5),
            widget.isRecurring != 'false'
                ? Text(
              widget.isRecurring,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            )
                : Container(),
          ],
        ),
        trailing: Checkbox(
          value: isCompleted,
          onChanged: (bool? value) {
            setState(() {
              isCompleted = value!;
            });
          },
        ),
      ),
    );
  }
}

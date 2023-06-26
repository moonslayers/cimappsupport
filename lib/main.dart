import 'package:cimarron_psic2/Menu_drawer.dart';
import 'package:flutter/material.dart';



import 'routes.dart';

void main() async {
  runApp(const FeedPage());
}

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});


  @override
  Widget build(BuildContext context) {

    Post examplePost = const Post(
      userName: 'jorge',
      date: '24/04/23',
      location: 'desde la facultad de ciencias',
      title: 'esta quedando al fregazo',
      textContent: 'nice, Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
          'Alps. Situated 1,578 meters above sea level, it is one of the '
          'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
          'half-hour walk through pastures and pine forest, leads you to the '
          'lake, which warms to 20 degrees Celsius in the summer. Activities '
          'enjoyed here include rowing, and riding the summer toboggan run.',
      numLikes: 5,
      numComments: 2,
    );

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
          children: [
            examplePost,
          ],
        ),
      ),
    );
  }
}

class Post extends StatefulWidget {
  final String userName;
  final String date;
  final String location;
  final String title;
  final String textContent;
  final int numLikes;
  final int numComments;

  const Post({
    Key? key,
    required this.userName,
    required this.date,
    required this.location,
    required this.title,
    required this.textContent,
    required this.numLikes,
    required this.numComments,
  }) : super(key: key);



  @override
  State<Post> createState() => _Post();
}

class _Post extends State<Post> {
  bool _isFavorited = false;
  int _favoriteCount = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                child: Icon(Icons.person,
                  color: Color(0xFFDD971A),
                ),
                backgroundColor: Color(0xFF00723F),
              ),
              SizedBox(width: 10),
              Text(widget.userName, style: TextStyle(fontWeight: FontWeight.bold)),
              Expanded(child: SizedBox()),
              Text(widget.date),
            ],
          ),
          const SizedBox(height:10),
          Text(widget.location, style: TextStyle(fontStyle: FontStyle.italic)),
          const SizedBox(height: 10),
          Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 10),
          Text(widget.textContent),
          const SizedBox(height: 10),
          Row(
            children: [
              IconButton(
                padding: const EdgeInsets.all(0),
                alignment: Alignment.centerRight,
                icon: (_isFavorited
                    ? const Icon(Icons.thumb_up)
                    : const Icon(Icons.thumb_up_alt_outlined)),
                color: const Color(0xFFDD971A),
                onPressed: _toggleFavorite,
              ),
              SizedBox(width: 5),
              Text(_favoriteCount.toString()),
              SizedBox(width: 10),
              const Icon(Icons.comment,
                color: Color(0xFFDD971A),
              ),
              SizedBox(width: 5),
              Text(widget.numComments.toString()),
              SizedBox(width: 10),
              const Icon(Icons.flag,
                color: Color(0xFFDD971A),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }
}


class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited
                ? const Icon(Icons.thumb_up)
                : const Icon(Icons.thumb_up_alt_outlined)),
            color: const Color(0xFFDD971A),
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: SizedBox(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }
}


//------------------------- TapboxA ----------------------------------

class TapboxA extends StatefulWidget {
  const TapboxA({super.key});

  @override
  State<TapboxA> createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
        child: Center(
          child: Text(
            _active ? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

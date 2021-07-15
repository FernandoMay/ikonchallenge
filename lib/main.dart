import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ikon Challenge',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const Home(),
    );
  }
}

final contacts = <String>[
  'Marco Franco',
  'Raul Alday',
  'Jessica Alba',
  'Roger Waters',
  'Darth Vader',
  'Homer Simpson',
  'Bill Gates',
  'Elon Musk',
  'Enrique Peña',
  'Angeles Rodriguez',
  'Monica Alvarado',
  'Estrella Fugaz',
  'Juana Lopez',
];

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final List items =
        List.generate(contacts.length, (i) => Rectangulo(contacts[i]));
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            title: Text(
              'Ikon Challenge',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((ctx, i) {
            return items[i];
          }, childCount: items.length))
        ],
      ),
    );
  }
}

class Rectangulo extends StatelessWidget {
  const Rectangulo(this.index, {Key? key}) : super(key: key);

  final String index;

  @override
  Widget build(BuildContext context) {
    final rnd = new Random();

    final r = rnd.nextInt(255);
    final g = rnd.nextInt(255);
    final b = rnd.nextInt(255);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Color.fromRGBO(r, g, b, 1),
            child: Center(
              child: Text(
                index[0],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "$index",
              style: TextStyle(
                color: Colors.blueGrey[900],
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

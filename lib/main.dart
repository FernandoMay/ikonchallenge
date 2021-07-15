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
      home: Home(),
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
      appBar: AppBar(
        title: SearchField(),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            expandedHeight: 180.0,
            pinned: true,
            flexibleSpace: new FlexibleSpaceBar(
              title: Text(
                'Address Book',
                style: TextStyle(color: Colors.white),
              ),
              background: new Image.network("https://picsum.photos/200?blur=1",
                  fit: BoxFit.cover),
            ),
          ),
          SliverPadding(padding: EdgeInsets.all(8)),
          SliverList(
            delegate: SliverChildBuilderDelegate((ctx, i) {
              return items[i];
            }, childCount: items.length),
          ),
          SliverPadding(padding: EdgeInsets.all(8)),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.97,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (value) => print(value),
        cursorColor: Colors.cyan,
        decoration: InputDecoration(
            // contentPadding: EdgeInsets.symmetric(
            //     horizontal: getProportionateScreenWidth(20),
            //     vertical: getProportionateScreenWidth(9)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Search person",
            prefixIcon: Icon(Icons.search)),
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

    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailScreen(name: index)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(width: 10),
            Hero(
              tag: index,
              child: CircleAvatar(
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
            ),
            SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "$index",
                style: TextStyle(
                  color: Colors.blueGrey[900],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String name;
  const DetailScreen({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Text(
              "$name",
              style: TextStyle(
                color: Colors.blueGrey[900],
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Hero(
              tag: name,
              child: Image.network(
                "https://picsum.photos/300",
                width: 300,
                height: 300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

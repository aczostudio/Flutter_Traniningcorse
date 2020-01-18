import 'package:flutter/material.dart';

class MyCards extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card Widgets',
      theme: ThemeData(
        primarySwatch:
        Colors.orange,
      ),
      home: MyCardsPage(title: 'Flutter Cards Page'),
    );
  }
}

class MyCardsPage extends StatefulWidget {
  MyCardsPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyCardsPageState createState() => _MyCardsPageState();
}

class _MyCardsPageState extends State<MyCardsPage> {
  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(itemBuilder: (context, int)
      {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image(
              image: AssetImage('assets/kitten400x400_2.gif'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'News title',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'date'
              ),
            ),
            Image(
              image: AssetImage('assets/kitten400x400gif.gif'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'News Title',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('date'),
            ),
          ],
        );
      })
    );
  }
}
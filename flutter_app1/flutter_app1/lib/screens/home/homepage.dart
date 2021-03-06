import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/widgets/card.dart';
import 'dart:math' as math;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Color _color = Colors.black;


  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
      _color = Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
          .withOpacity(1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text('News'),
              leading: GestureDetector(
                onTap: () {debugPrint('Back button tapped');},
              ),
            ),
            child: Row(
//              children: <Widget>[
//                Icon(CupertinoIcons.left_chevron),
//                Text(
//                  'Back',
//                      style: TextStyle(
//                    color: CupertinoColors.activeBlue,
//                )
//                )
//              ]
              children: buildBody(_counter, _color),
            )
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
              actions: <Widget>[Icon(Icons.create)],
              backgroundColor: Colors.amber,
            ),
            drawer: Drawer(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    title: Text("Cards"),
                    trailing: Icon(Icons.receipt),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => MyCards()));
                    },
                  ),
                  ListTile(
                    title: Text("Details"),
                    trailing: Icon(Icons.description),
//              onTap: (){
//                Navigator.of(context).pop();
//                Navigator.of(context).push(
//                    MaterialPageRoute( builder: (BuildContext context) => MyDetails(newsli) )
//                );
//              },
                  ),
                ],
              ),
            ),
            body: buildBody(_counter, _color),
            floatingActionButton: FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          );
  }
}

buildBody(int con, Color col) {
  return SingleChildScrollView(
    // Center is a layout widget. It takes a single child and positions it
    // in the middle of the parent.
    child: Column(
      // Column is also a layout widget. It takes a list of children and
      // arranges them vertically. By default, it sizes itself to fit its
      // children horizontally, and tries to be as tall as its parent.
      //
      // Invoke "debug painting" (press "p" in the console, choose the
      // "Toggle Debug Paint" action from the Flutter Inspector in Android
      // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
      // to see the wireframe for each widget.
      //
      // Column has various properties to control how it sizes itself and
      // how it positions its children. Here we use mainAxisAlignment to
      // center the children vertically; the main axis here is the vertical
      // axis because Columns are vertical (the cross axis would be
      // horizontal).
//          mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image(
          image: AssetImage('assets/kitten400x400gif.gif'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'News Title',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('date'),
        ),
//            Text('KFJKLSDJFLKJS'),
//            Text('asdakdjfklasd'),
//            Text('KFJKLSDJFLKJS'),
//            Text('asdakdjfklasd'),
//            Text('KFJKLSDJFLKJS'),
//            Text('asdakdjfklasd'),
//            Text('KFJKLSDJFLKJS'),
//            Text('asdakdjfklasd'),
//            Text('KFJKLSDJFLKJS'),
//            Text('asdakdjfklasd'),
//            Text('KFJKLSDJFLKJS'),
//            Text('asdakdjfklasd'),
//            Text('KFJKLSDJFLKJS'),
//            Text('asdakdjfklasd'),
//            Text('KFJKLSDJFLKJS'),
//            Text('asdakdjfklasd'),
//            Text('KFJKLSDJFLKJS'),
//            Text('asdakdjfklasd'),
//            Text('KFJKLSDJFLKJS'),
//            Text('asdakdjfklasd'),
//            Text('KFJKLSDJFLKJS'),
//            Text('asdakdjfklasd'),
//            Text('KFJKLSDJFLKJS'),
//            Text('asdakdjfklasd'),
//            Text('KFJKLSDJFLKJS'),
//            Text('asdakdjfklasd'),
//            Text('KFJKLSDJFLKJS'),
//            Text('asdakdjfklasd'),
//            Text('KFJKLSDJFLKJS'),
//            Text('asdakdjfklasd'),
//            Text('KFJKLSDJFLKJS'),
//            Text('asdakdjfklasd'),
//            Text('KFJKLSDJFLKJS'),
//            Text('asdakdjfklasd'),
//            Text('KFJKLSDJFLKJS'),
//            Text('asdakdjfklasd'),
//            Text('KFJKLSDJFLKJS'),
//            Text('asdakdjfklasd'),
//            Text('KFJKLSDJFLKJS'),
//            Text('asdakdjfklasd'),
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'You have pushed the button this many times:',
              ),
            ),
            Text('$con',
                style: TextStyle(
                    fontSize: 34.0, fontWeight: FontWeight.normal, color: col)
                // style: Theme.of(context).textTheme.display1,
                ),
          ],
        ),
      ],
    ),
  );
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.blue),
    ));
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return (HomePageState());
  }
}

class HomePageState extends State {
  int _counter = 0;

  handleAddCounter() {
    setState(() {
      _counter = _counter + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo Home Page'),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: Column(
              children: [
                Text('You have pushed the button this many times:'),
                Text(_counter.toString()),
              ],
            ),
          ),
          FloatingActionButton(
              onPressed: () => handleAddCounter(),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ))
        ]),
      ),
    ));
  }
}

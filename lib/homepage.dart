import 'dart:async';

import 'package:flutter/material.dart';
import 'package:playground/review.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Homepage'),
        ),
        body: new Center(
          child: InkWell(
              child: Text("Give Review"),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Review()));
              }),
        ),
      ),
    );
  }
}

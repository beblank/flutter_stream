import 'package:flutter/material.dart';
import 'package:playground/bloc.dart';

class Review extends StatefulWidget {
  Review({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Review createState() => _Review();
}

class _Review extends State<Review> {
  static final reviewBloc = ReviewBloc();
  Stream<String> stream = new Stream.empty();

  @override
  void initState() {
    print("Creating a sample stream...");
    print("Created the stream");
    reviewBloc.reviewState.listen((data) {
      print("DataReceived: " + data);
      switch (data) {
        case "event":
          print("event: " + data);
          break;
        case "done":
          print("done: " + data);
          break;
        default:
      }
    }, onDone: () {
      print("Task Done");
    }, onError: (error) {
      print("Some Error");
    });
    print("code controller is here");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(children: <Widget>[
            InkWell(
                child: Text("Review Item"),
                onTap: () {
                  // stream = new Stream.fromFuture(reviewBloc.getData());
                  // stream.listen((data) {
                  //   print("DataReceived: " + data);
                  // }, onDone: () {
                  //   print("Task Done");
                  // }, onError: (error) {
                  //   print("Some Error");
                  // });
                  reviewBloc.fetchData(5);
                }),
            InkWell(
                child: Text("Back"),
                onTap: () {
                  Navigator.of(context).pop();
                  //reviewBloc.fetchData(2);
                }),
          ]),
        ),
      ),
    );
  }
}

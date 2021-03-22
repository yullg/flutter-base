import 'package:base/base.dart';
import 'package:flutter/material.dart';

Logger logger;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: GestureDetector(
            onTap: () {
              print(DateTimeHelper.format(DateTime.now(), "yyy-M-d H:m:s.S"));
            },
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}

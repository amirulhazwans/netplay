import 'package:flutter/material.dart';

void main() {
  runApp(profile());
}

class profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World App',
      home: Scaffold(
        body: Center(
          child: Text(
            'Hello, World!',
            style: TextStyle(fontSize: 24.0),
          ),
        ),
      ),
    );
  }
}

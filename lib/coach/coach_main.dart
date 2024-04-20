import 'package:flutter/material.dart';

void main() {
  runApp(Coach());
}

class Coach extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Badminton Coach',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CoachHomePage(),
    );
  }
}

class CoachHomePage extends StatefulWidget {
  @override
  _CoachHomePageState createState() => _CoachHomePageState();
}

class _CoachHomePageState extends State<CoachHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Badminton Coach'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Number of Shots: $_counter',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: Text('Hit Shuttlecock'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to Technique Tips page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TechniqueTipsPage()),
                );
              },
              child: Text('Technique Tips'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add additional functionality here
        },
        tooltip: 'More Options',
        child: Icon(Icons.more_vert),
      ),
    );
  }
}

class TechniqueTipsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Technique Tips'),
      ),
      body: Center(
        child: Text(
          'Here you can find tips and techniques for improving your badminton game.',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}

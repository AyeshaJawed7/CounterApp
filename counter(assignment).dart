import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(), // Show the splash screen initially
      routes: {
        // Define routes for different screens
        '/counter': (context) => CounterApp(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the counter screen after a delay of 10 seconds
    Future.delayed(Duration(seconds: 6), () {
      Navigator.pushReplacementNamed(context, '/counter');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/logo.png'),
      ),
    );
  }
}

// Stateless widget for the counter app
class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CountingState(),
    );
  }
}

// Stateful widget for counting state
class CountingState extends StatefulWidget {
  @override
  _CountingState createState() => _CountingState();
}

class _CountingState extends State<CountingState> {
  int count = 0;
  String message = "";

  void incrementCount() {
    setState(() {
      count++;
      updateMessage();
    });
  }

  void decrementCount() {
    if (count > 0) {
      setState(() {
        count--;
        updateMessage();
      });
    }
  }

  void updateMessage() {
    if (count == 0) {
      message = "' Reach the limit '";
    } else if (count == 5) {
      message = "' This is five '";
    } else if (count == 20) {
      message = "' This is 20 '";
    } else {
      message = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Counter App Assignment',
          style: TextStyle(
            fontFamily: 'MyCustomFont',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white60,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current Count:',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'MyCustomFont',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '$count',
              style: TextStyle(
                fontSize: 50,
                color: count == 0
                    ? Colors.red
                    : count == 5
                        ? Colors.green
                        : count == 20
                            ? Colors.purple
                            : count < 20
                                ? Colors.black
                                : Colors.orange,
              ),
            ),
            SizedBox(height: 22),
            Text(
              message,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: count == 0
                    ? Colors.red
                    : count == 5
                        ? Colors.green
                        : count == 20
                            ? Colors.purple
                            : Colors.transparent,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: decrementCount,
            child: Icon(Icons.remove),
            backgroundColor: Colors.black,
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: incrementCount,
            child: Icon(Icons.add),
            backgroundColor: Colors.black,
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black, // Set footer background color here
        child: Container(
          height: 50, // Adjust the height of the footer as needed
          child: Center(
            child: Text(
              'All rights reserved by @Ayesha Jawed',
              style: TextStyle(
                color: Colors.white, // Set text color of the footer
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Design class with "Let's begin your counting" text and a floating button
class Counting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counting'),
      ),
      body: Center(
        child: Text(
          "Let's begin your counting",
          style: TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CountingState()),
          );
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}

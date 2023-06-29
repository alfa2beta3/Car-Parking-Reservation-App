import 'package:flutter/material.dart';
import 'baseapp.dart' as baseapp;
import 'booking.dart' as booking;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: baseapp.BaseApp(),
      routes: <String, WidgetBuilder>{
        '/Booking': (context) => booking.Booking(),
        '/BaseApp': (context) => baseapp.BaseApp(),
      },
    );
  }
}

import 'package:flutter/material.dart';

String text = '';

class Booking extends StatefulWidget {

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Booking',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 400,
                  alignment: Alignment.center,
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontSize: 40,
                    ),
                  ),
                ),
              ),
              FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.pushNamed(context,'/BaseApp');
                  },
                  label: const Text(
                    'return',
                    style: TextStyle(fontSize: 40),
                  ),
                  icon: const Icon(Icons.keyboard_return, size: 40)),
            ],
          ),
        ),
      );
  }
}
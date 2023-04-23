import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


String text = '';

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
  bool p1Visible = true;
  bool p2Visible = false;

  void p1_jmp_p2() {
    setState(() {
      p1Visible = !p1Visible;
      p2Visible = !p2Visible;
    });
  }

  void p2_jmp_p1() {
    setState(() {
      p1Visible = !p1Visible;
      p2Visible = !p2Visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Car Park Booking App',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
            ),
            Visibility(
              visible: p1Visible,
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset('assets/car_park.jpg'),
                    SizedBox(
                      height: 80,
                      width: 200,
                      child: FloatingActionButton.extended(
                        onPressed: () {
                          p1_jmp_p2();
                        },
                        shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        backgroundColor: Colors.red,
                        label: const Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                        icon: const Icon(
                          Icons.app_registration,
                          size: 40,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Visibility(
              visible: p2Visible,
              child: Expanded(
                child: Column(
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
                        onPressed: () async {
                          final response = await http
                              .get(Uri.parse("https://leexingyang.pythonanywhere.com/user"));
                          final decoded = jsonDecode(response.body);

                          setState(() {
                            text = decoded['text'];
                          });
                        },
                        shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        backgroundColor: Colors.lightBlueAccent,
                        label: const Text(
                          'show text',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        )),
                    FloatingActionButton.extended(
                        onPressed: () {
                          p2_jmp_p1();
                        },
                        label: const Text(
                          'return',
                          style: TextStyle(fontSize: 40),
                        ),
                        icon: const Icon(Icons.keyboard_return, size: 40)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

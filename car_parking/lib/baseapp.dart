import 'package:flutter/material.dart';

class BaseApp extends StatefulWidget {
  @override
  State<BaseApp> createState() => _BaseAppState();
}

class _BaseAppState extends State<BaseApp> {

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     home: Scaffold(
       appBar: AppBar(
          title: const Text(
            'Car Parks Booking App',
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
              Expanded(
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
                          Navigator.pushNamed(context, '/Booking');
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
          ],
        ),
      ),
    );
  }
}
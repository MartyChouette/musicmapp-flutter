import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:musicmapp4/create.dart';
import 'settings.dart';
import 'feed.dart';

class MySettingsPage extends StatefulWidget {
  const MySettingsPage({super.key, required this.title});

  final String title;

  @override
  State<MySettingsPage> createState() => _MySettingsPageState();
}

class _MySettingsPageState extends State<MySettingsPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    label:'Settings';
    return Scaffold(
      appBar: AppBar(

        title: Image.asset('assets/musicmappicon.png',
          fit: BoxFit.contain,
          height: 100,
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.greenAccent,
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
                'LOGO PLACE HOLDER'
            ),
            Text(
                'Settings PAGE'
            ),

          ],
        ),
      ),


      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

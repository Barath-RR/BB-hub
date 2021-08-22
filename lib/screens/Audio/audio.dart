import 'package:flutter/material.dart';
import './src/pages/index.dart';

class AudioScreen extends StatefulWidget {
  static const String id = 'audio_screen';
  @override
  _AudioScreenState createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen>{
    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IndexPage(),
    );
  }
}

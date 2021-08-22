import 'package:flutter/material.dart';

import 'package:slamdunk/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:slamdunk/screens/chat_screen.dart';
import 'package:slamdunk/screens/map.dart';
import 'package:slamdunk/screens/places.dart';
import 'package:slamdunk/screens/profile.dart';
import 'package:slamdunk/screens/question.dart';
import 'package:slamdunk/screens/Audio/audio.dart';
class BottonScreen extends StatefulWidget {
  static const String id = 'botton_screen';
  @override
  _BottonScreenState createState() => _BottonScreenState();
  Widget build(BuildContext context) {
    return MaterialApp(
    );
  }
}

class _BottonScreenState extends State<BottonScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  User? loggedInUser;
  String messagesText='';
  @override
  void initState() {
    super.initState();
    getCurrentUser();
    print(loggedInUser!.email);
  }
  void getCurrentUser() async{
    try{
      final user = _auth.currentUser;
      if (user !=null){
        loggedInUser = user;
      }
    } catch (e){
      print(e);
    }

  }
  void messagesStream() async{
    await for( var snapshot in _firestore.collection('messages').snapshots()){
      for( var message in snapshot.docs){
        print(message.data());
      }
    }
  }
  int _currentIndex = 0;
  final List <Widget> _children = [
    CategoryQuestion(),
    AudioScreen(),
    MapScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];
  void onTappedBar(int index)
  {
    setState(() {
      _currentIndex = index;
    });
  }
  @override

  Widget build(BuildContext context) {

    return Scaffold(
        bottomNavigationBar:BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white.withOpacity(.60),
    selectedFontSize: 14,
    unselectedFontSize: 14,
    onTap: onTappedBar,
    currentIndex: _currentIndex,


    items: [
    BottomNavigationBarItem(
    title: Text('Blog'),
    icon: Icon(Icons.library_books),
    ),
    BottomNavigationBarItem(
    title: Text('Partner'),
    icon: Icon(Icons.video_call),

    ),
    BottomNavigationBarItem(
    title: Text('Connect'),
    icon: Icon(Icons.location_on),
    ),
    BottomNavigationBarItem(
    title: Text('Chat'),
    icon: Icon(Icons.chat_bubble),
    ),
      BottomNavigationBarItem(
        title: Text('Profile'),
        icon: Icon(Icons.account_circle_outlined),
      ),
    ],
    ),
    body: _children.elementAt(_currentIndex),
    );
  }
}
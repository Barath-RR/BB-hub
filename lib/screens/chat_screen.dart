import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:slamdunk/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:slamdunk/screens/places.dart';
import 'package:slamdunk/screens/question.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
  Widget build(BuildContext context) {
    return MaterialApp(
    );
  }
}

class _ChatScreenState extends State<ChatScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  User? loggedInUser;
  String messagesText='';

  get isMe => true;
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
    Places(),
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
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              // crossAxisAlignment: CrossAxisAlignment.center,
              //decoration: kMessageContainerDecoration,
              // mainAxisSize: MainAxisSize.max,
              child: Row(

                children: <Widget>[
                  Expanded(
                    child:
                    TextField(
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () { },

                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,

                    ),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
        Padding(

          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                'Barath',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.white,
                ),
              ),
              Material(
                borderRadius: isMe
                    ? BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0))
                    : BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                elevation: 5.0,
                color: isMe ? Colors.white: Colors.black,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    'Hey Hi this chat section connects you with every every User Around the globe',
                    style: TextStyle(
                      color: isMe ? Colors.black : Colors.white,
                      fontSize: 15.0,
                    ),
                  ),

                ),
              ),
            ],
          ),
        )

          ],

        ),
      ),
    );
  }
}
class MessageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var isMe;
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Text(
            'Barath',
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
          Material(
            borderRadius: isMe
                ? BorderRadius.only(
                topLeft: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0))
                : BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            elevation: 5.0,
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                '',
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black54,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
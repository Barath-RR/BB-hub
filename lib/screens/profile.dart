import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = 'chat_screen';
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
  Widget build(BuildContext context) {
    return MaterialApp(
    );
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('images/hi.jpg'),
                ),
                Text(
                  'JOJO',
                  style: TextStyle(
                    fontFamily: 'Dancing Script',
                    fontSize: 40.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                Text(
                  'Los Angeles Lakers',
                  style: TextStyle(
                    //fontFamily: 'Source Sans Pro',
                    color: Colors.black,
                    fontSize: 20.0,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  'stand tall-talk small-play ball',
                  style: TextStyle(
                    //fontFamily: 'Source Sans Pro',
                    color: Colors.red,
                    fontSize: 20.0,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),


                SizedBox(
                  height: 20.0,
                  width: 150.0,
                  child: Divider(
                    color: Colors.black,
                  ),

                ),
                Card(
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.add_box_rounded,
                        color: Colors.black,
                      ),
                      title: Text(
                        'Connection - 0',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0,
                        ),
                      ),
                    )),

                Card(
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.insert_comment_outlined,
                        color: Colors.black,
                      ),
                      title: Text(
                        'My Blog',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0,
                        ),
                      ),
                    )),
                Card(
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      title: Text(
                        'barath@gmail.com',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontFamily: 'Source Sans Pro'),
                      ),
                    )),

              ],
            )),
      ),
    );
  }
}
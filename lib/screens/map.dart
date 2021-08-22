import 'package:flutter/material.dart';
import 'package:slamdunk/screens/google_map_screen.dart';
import 'package:url_launcher/url_launcher.dart';
class MapScreen extends StatefulWidget {
  static const String id = 'map_screen';
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const String _title = 'Connect';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
            title: const Text(_title),
          backgroundColor: Colors.black,
        ),
        body: const MyStatelessWidget(),
      ),
    );
  }
}
class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(bottom: 8),
        children:<Widget>[ Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.album),
                title: Text('Anyone there to play Today?'),
                subtitle: Text('Join me at 6 pm,Click the join now '),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 230,
                      minHeight: 100,
                      maxWidth: 230,
                      maxHeight: 100,
                    ),
                    child: Image.asset('images/map.jpg', fit: BoxFit.cover),
                  ),
                  const SizedBox(width: 8),

                  const SizedBox(width: 8),
                  TextButton(
                    child: Text('Join Now'),
                    onPressed: _launchURL,
                  ),

                ],
              ),],


          ),

        ),
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.album),
                  title: Text('Match Day Mania'),
                  subtitle: Text('Join here for Match Day Fun.'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 230,
                        minHeight: 100,
                        maxWidth: 230,
                        maxHeight: 100,
                      ),
                      child: Image.asset('images/map.jpg', fit: BoxFit.cover),

                    ),

                    //const SizedBox(width: 8),


                    const SizedBox(width: 8),
                    TextButton(
                      child: Text('Join Now'),
                      onPressed: _launchURL,
                    ),
                  ],
                ),],


            ),

          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => GoogleMapScreen(),)),
        child: Icon(Icons.pin_drop_outlined),
        backgroundColor: Colors.black,
      ),

    );
  }
}
_launchURL() async {
  const url = 'https://www.google.co.in/maps/place/SKCET+basketball+court/@10.9349483,76.90347,13z/data=!4m9!1m2!2m1!1sbasketball+court!3m5!1s0x0:0x744e4cebc001cdb4!8m2!3d10.9360888!4d76.9574057!15sChBiYXNrZXRiYWxsIGNvdXJ0kgEQYmFza2V0YmFsbF9jb3VydA';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

import 'package:flutter/material.dart';
import 'package:slamdunk/screens/welcome_screen.dart';
import 'package:slamdunk/screens/login_screen.dart';
import 'package:slamdunk/screens/registration_screen.dart';
import 'package:slamdunk/screens/chat_screen.dart';
import 'package:slamdunk/screens/question.dart';
import 'package:slamdunk/screens/places.dart';
import 'package:slamdunk/screens/bottom.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:slamdunk/screens/map.dart';
import 'package:slamdunk/screens/Audio/audio.dart';
import 'package:slamdunk/screens/profile.dart';
import 'package:slamdunk/screens/form.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: WelcomeScreen.id,
      routes:{
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        CategoryQuestion.id: (context) => CategoryQuestion(),
        Places.id: (context) => Places(),
        BottonScreen.id: (context) => BottonScreen(),
        MapScreen.id: (context) => MapScreen(),
        AudioScreen.id: (context) => AudioScreen(),
        ProfileScreen.id: (context) => ProfileScreen(),
        FormScreen.id: (context) => FormScreen(),
      },
    );
  }
}
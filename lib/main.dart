
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_session/firebase_options.dart';
import 'package:firebase_session/screens/chatt_screen.dart';
import 'package:firebase_session/screens/login_screen.dart';
import 'package:firebase_session/screens/sinup_screen.dart';
import 'package:firebase_session/screens/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: WelcomeScreen.routeName,
      routes: {
        WelcomeScreen.routeName: (context) => WelcomeScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        SignupScreen.routeName: (context) => SignupScreen(),
        ChattScreen.routeName: (context) => ChattScreen(),
      },
    );
  }
}


import 'package:firebase_session/theming/colors.dart';
import 'package:firebase_session/widgets/button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SignupScreen extends StatefulWidget {
  static const String routeName = "signup_screen";

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 400,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/message.png'),
                                fit: BoxFit.cover)),
                      ),
                      Text(
                        'Welcome to Chat App',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[900]),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        label: Text('Email'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colortheme.sacond)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colortheme.sacond)),
                        focusColor: Colortheme.primary,
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                      obscureText: true,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        label: Text('password'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colortheme.sacond)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colortheme.sacond)),
                        focusColor: Colortheme.primary,
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  ButtonWidget(
                      text: 'register',
                      color: Colortheme.primary,
                      onPressrd: () async {}),
                ])));
  }
}



import 'package:firebase_session/theming/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChattScreen extends StatefulWidget {
  static const String routeName = "ChattScreen";

  @override
  State<ChattScreen> createState() => _ChattScreenState();
}

class _ChattScreenState extends State<ChattScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colortheme.sacond.withAlpha(150),
        title: Row(
          children: [
            Image.asset(
              "assets/images/message.png",
              height: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Text("Chats"),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {

            },
            icon: Icon(Icons.logout_outlined),
          )
        ],
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

            Container(),
          Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colortheme.primary, width: 2)),
              child:
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                Expanded(
                    child: TextField(
                      
                  onChanged: (value) {
                    
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: InputBorder.none,
                    hintText: "write your message",
                  ),
                )),
                TextButton(
                    onPressed: () {

                      
                    },
                    child: Text(
                      "Send",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colortheme.primary),
                    ))
              ]))
        ],
      )),
    );
  }
}

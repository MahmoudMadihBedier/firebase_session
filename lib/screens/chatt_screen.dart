import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_session/theming/colors.dart';
import 'package:firebase_session/widgets/massage_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChattScreen extends StatefulWidget {
  static const String routeName = "ChattScreen";

  @override
  State<ChattScreen> createState() => _ChattScreenState();
}

class _ChattScreenState extends State<ChattScreen> {
  final frieStore = FirebaseFirestore.instance;
  TextEditingController messegeContoroller = TextEditingController();
  final auth = FirebaseAuth.instance;
  late User signedInUser;
  String? message;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = auth.currentUser;
      if (user != null) {
        signedInUser = user;
        print(signedInUser.email);
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

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
            onPressed: () {},
            icon: Icon(Icons.logout_outlined),
          )
        ],
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: frieStore.collection("messages").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("${snapshot.error}"),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Center(
                  child: Text("No messages yet"),
                );
              }
              final messages = snapshot.data!.docs;
              List<Widget> messageWidget = messages.map((message) {
                final messageText = message.get("text");
                final messageSender = message.get("sender");
                final isMe = messageSender == signedInUser.email;

                return MessageBubble(
                    text: messageText,
                     sender: messageSender, 
                     isMe: isMe);
              }).toList();
              return Expanded(
                  child: ListView(
                reverse: true,
                children: messageWidget,
              ));
            },
          ),
          Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colortheme.primary, width: 2)),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Expanded(
                    child: TextField(
                  controller: messegeContoroller,
                  onChanged: (value) {
                    message = value;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: InputBorder.none,
                    hintText: "write your message",
                  ),
                )),
                TextButton(
                    onPressed: () {
                      frieStore
                          .collection("messages")
                          .add({"text": message, "sender": signedInUser.email});
                      messegeContoroller.clear();
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

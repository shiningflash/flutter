import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:muhurtho/models/message.dart';
import 'package:muhurtho/models/user.dart';

class ChatScreen extends StatefulWidget {

  final User user;
  ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  // List <Message> messages = new Message().messages;
  // User currentUser = new Message().getCurrentUser();

  _buildMessage(Message message, bool isMe) {

    final Container msg = Container(
      margin: isMe
          ? EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
        left: 80.0,
      )
          : EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
        right: 10,
      ),
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
          color: isMe ? Colors.yellow[50] : Color(0xFFFFEFEE),
          borderRadius: isMe
              ? BorderRadius.only(
            topLeft: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0),
          )
              : BorderRadius.only(
            topRight: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(message.time,
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.0),
          Text(message.text,
            style: TextStyle(
              color: Colors.blueGrey[800],
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );

    if (isMe) {
      return msg;
    }

    return Row(
      children: <Widget>[
        msg,
        IconButton(
            icon: message.isLiked ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
            iconSize: 25.0,
            color: message.isLiked
                ? Colors.redAccent
                : Colors.black,
            onPressed: () {}
        ),
      ],
    );
  }

  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0,),
      height: 60.0,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.photo),
              iconSize: 25.0,
              color: Colors.redAccent,
              onPressed: () {},
          ),
          Expanded(child: TextField(
            textCapitalization: TextCapitalization.sentences,
            onChanged: (value) {},
            decoration: InputDecoration(
              hintText: 'Send a message...',
            ),
          )),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25.0,
            color: Colors.redAccent,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final currentUser = new Message().getCurrentUser();

    final List<Message> messages = [
      Message(
        sender: widget.user,
        time: '5:33 PM',
        text: 'Did you mean a joke?',
        isLiked: false,
        unread: true,
      ),
      Message(
        sender: currentUser,
        time: '5:33 PM',
        text: 'Yesss, tell me something funny...',
        isLiked: false,
        unread: true,
      ),
      Message(
        sender: widget.user,
        time: '5:31 PM',
        text: 'Excellent! How can I help you? I can sing a good song specially for you. 😉 Or if you like to hear a story?',
        isLiked: true,
        unread: true,
      ),
      Message(
        sender: currentUser,
        time: '5:31 PM',
        text: 'So, how\'s it going?',
        isLiked: false,
        unread: true,
      ),
      Message(
        sender: currentUser,
        time: '5:31 PM',
        text: 'Thanks! You too. 😃',
      ),
      Message(
        sender: widget.user,
        time: '5:30 PM',
        text: 'Yo! Good Morning...',
        isLiked: true,
        unread: true,
      ),
      Message(
        sender: currentUser,
        time: '5:30 PM',
        text: 'Hey, how\'s it going?',
        isLiked: false,
        unread: true,
      ),
    ];

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        toolbarHeight: 65,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,),
        ),
        title: Text(widget.user.name,
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        elevation: 3.0,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.more_horiz),
              iconSize: 30.0,
              color: Colors.black,
              onPressed: () {

              }),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: ClipRRect(
                  /*borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),*/
                  child: ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.only(top: 15.0),
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Message message = messages[index];
                      print(message);
                      final bool isMe = message.sender.id == currentUser.id;
                      return _buildMessage(message, isMe);
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 5,),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }
}

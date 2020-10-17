import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
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
        time: '5:30 PM',
        text: 'Hey, how\'s it going? Hey, how\'s it going? Hey, how\'s it going? Hey, how\'s it going?',
        isLiked: false,
        unread: true,
      ),
      Message(
        sender: currentUser,
        time: '5:30 PM',
        text: 'Hey, how\'s it going? Hey, how\'s it going? Hey, how\'s it going? Hey, how\'s it going?',
        isLiked: false,
        unread: true,
      ),
      Message(
        sender: widget.user,
        time: '5:30 PM',
        text: 'Hey, how\'s it going?',
        isLiked: true,
        unread: true,
      ),
      Message(
        sender: widget.user,
        time: '5:30 PM',
        text: 'Hey, how\'s it going? Hey, how\'s it going? Hey, how\'s it going? Hey, how\'s it going?',
        isLiked: false,
        unread: true,
      ),
      Message(
        sender: currentUser,
        time: '5:30 PM',
        text: 'Hey, how\'s it going? Hey, how\'s it going? Hey, how\'s it going? Hey, how\'s it going?',
        isLiked: false,
        unread: true,
      ),
      Message(
        sender: widget.user,
        time: '5:30 PM',
        text: 'Hey, how\'s it going?',
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
      Message(
        sender: currentUser,
        time: '5:30 PM',
        text: 'Hey, how\'s it going?',
        isLiked: false,
        unread: true,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar:  AppBar(
        backgroundColor: Colors.grey[700],
        title: Text(widget.user.name,
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.more_horiz),
              iconSize: 30.0,
              color: Colors.white,
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
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
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
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }
}

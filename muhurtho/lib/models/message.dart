import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'user.dart';

class Message {
  final User sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool unread;

  Message({
    this.sender,
    this.time,
    this.text,
    this.isLiked,
    this.unread
  });

  static final User currentUser = User(
    id: 0,
    name: 'Current User',
    imageUrl: 'assets/images/logo.jpg',
  );

  User getCurrentUser() {
    return currentUser;
  }

  static final User afia = User(
    id: 1,
    name: 'Afia Abedin',
    imageUrl: 'assets/images/logo.jpg',
  );

  static final User muhurtho = User(
    id: 2,
    name: 'Muhurtho',
    imageUrl: 'assets/images/logo.jpg',
  );

  static final List<Message> messages = [
    Message(
      sender: afia,
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
    Message(
      sender: afia,
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
}
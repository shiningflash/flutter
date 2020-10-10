import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Center(
          child: Scaffold(
              appBar: AppBar(
                title: Text('Greetings App'),
                backgroundColor: Colors.blue,
              ),
              body: Center(
                child: Image(
                  image: NetworkImage(
                      "https://i.pinimg.com/originals/30/1b/78/301b780d487e84b2614c85497c75d07d.gif"),
                ),
              )),
        )),
  );
}

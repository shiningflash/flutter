import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: Scaffold(
          backgroundColor: Colors.blueGrey[500],
          appBar: AppBar(
            title: Text(
              "Pikachu",
            ),
            backgroundColor: Colors.blueGrey[800],
          ),
          body: Center(
              child: Image(
            image: AssetImage(
              "images/pikachu.png",
            ),
          )),
        ),
      ),
    ),
  );
}

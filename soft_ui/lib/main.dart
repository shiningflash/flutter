import 'package:flutter/material.dart';
import 'package:soft_ui/soft-buttons/active_button.dart';
import 'package:soft_ui/soft-buttons/button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool buttonPressed1 = false;
  bool buttonPressed2 = false;
  bool buttonPressed3 = false;
  bool buttonPressed4 = false;

  void _letsPress1() {
    setState(() {
      buttonPressed1 = true;
      buttonPressed2 = false;
      buttonPressed3 = false;
      buttonPressed4 = false;
    });
  }

  void _letsPress2() {
    setState(() {
      buttonPressed1 = false;
      buttonPressed2 = true;
      buttonPressed3 = false;
      buttonPressed4 = false;
    });
  }

  void _letsPress3() {
    setState(() {
      buttonPressed1 = false;
      buttonPressed2 = false;
      buttonPressed3 = true;
      buttonPressed4 = false;
    });
  }

  void _letsPress4() {
    setState(() {
      buttonPressed1 = false;
      buttonPressed2 = false;
      buttonPressed3 = false;
      buttonPressed4 = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text("Soft UI Design"),
        leading: Icon(Icons.menu),
        actions: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 5), child: Icon(Icons.search),),
          Padding(padding: EdgeInsets.symmetric(horizontal: 10), child: Icon(Icons.more_vert),),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: _letsPress1,
                        child: buttonPressed1 ? ButtonTapped(icon: Icons.home) : MyButton(icon: Icons.home),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: _letsPress2,
                        child: buttonPressed2 ? ButtonTapped(icon: Icons.settings) : MyButton(icon: Icons.settings),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: _letsPress3,
                        child: buttonPressed3 ? ButtonTapped(icon: Icons.favorite) : MyButton(icon: Icons.favorite),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: _letsPress4,
                        child: buttonPressed4 ? ButtonTapped(icon: Icons.message) : MyButton(icon: Icons.message),
                      ),
                    ),
                  ],
                ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(Icons.add),
      // ),
    );
  }
}

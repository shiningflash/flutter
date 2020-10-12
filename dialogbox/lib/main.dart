import 'package:dialogbox/dialogs.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool tappedOk = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(
          tappedOk.toString(),
          style: TextStyle(fontSize: 28,),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final action =
          await Dialogs.MyAbortDialog(context, 'My title', 'I’ve had similar issue, but I think it’s some kind of AVD problem there. I solved it creating new device, but had a lot of OSX (I’m still wondering how this is even posible) crashes until I stumble with the right one, that’s why I think there’s some kind of incompatibility between the hardware and the device it’s trying to emulate. tl;dr try changing the virtual device with another one.');
          if (action == DialogAction.ok) {
            setState(() => tappedOk = true);
          }
          else {
            setState(() => tappedOk = false);
          }
        },
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

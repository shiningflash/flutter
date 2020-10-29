import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
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
      title: 'Bottom Navigation Bar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Bottom Navigation Bar'),
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
  int currentIndex = 0;
  String pageDescription = "";

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  changePage(int index) {
    setState(() {
      currentIndex = index;
      switch(currentIndex) {
        case 0:
          pageDescription = "Home";
          break;
        case 1:
          pageDescription = "Folders";
          break;
        case 2:
          pageDescription = "Logs";
          break;
        case 3:
          pageDescription = "Lists";
          break;
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageDescription),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
      ),
      body: Center(
        child: Container(
          child: Text(
            pageDescription,
            style: TextStyle(
              fontSize: 30
            ),
          ),
        )
      ),
      bottomNavigationBar: BubbleBottomBar(
        opacity: 0.2,
        backgroundColor: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
        currentIndex: currentIndex,
        hasInk: true,
        inkColor: Colors.black12,
        hasNotch: true,
        fabLocation: BubbleBottomBarFabLocation.end,
        onTap: changePage,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
            icon: Icon(Icons.dashboard, color: Colors.black54,),
            backgroundColor: Colors.redAccent,
            activeIcon: Icon(Icons.dashboard, color: Colors.red,),
            title: Text('Home'),
          ),
          BubbleBottomBarItem(
            icon: Icon(Icons.folder_open, color: Colors.black54,),
            backgroundColor: Colors.indigoAccent,
            activeIcon: Icon(Icons.folder_open, color: Colors.indigoAccent,),
            title: Text('Folders'),
          ),
          BubbleBottomBarItem(
            icon: Icon(Icons.access_time, color: Colors.black54,),
            backgroundColor: Colors.blueAccent,
            activeIcon: Icon(Icons.access_time, color: Colors.blueAccent,),
            title: Text('Logs'),
          ),
          BubbleBottomBarItem(
            icon: Icon(Icons.list_rounded, color: Colors.black54,),
            backgroundColor: Colors.black87,
            activeIcon: Icon(Icons.list_rounded, color: Colors.black87,),
            title: Text('Lists'),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        backgroundColor: Colors.grey[700],
        child: Icon(Icons.shopping_cart_outlined),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

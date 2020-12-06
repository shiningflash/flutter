import 'dart:ui';

import 'package:data_collection_app/insert_data.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[900],
        title: Text(
          'Data Collection App',
        ),
      ),
      body: Padding(padding: const EdgeInsets.only(left: 0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.amber[50],
            image: DecorationImage(
              image: AssetImage('assets/halloween.jpeg'),
              colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.07), BlendMode.dstATop
              ),
                fit: BoxFit.cover,
              ),
            ),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Add new user',
                    style: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  IconButton(
                    icon: Icon(
                        Icons.add_circle_outline_outlined,
                        color: Colors.black,
                    ),
                    iconSize: 30,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => InsertData(),
                          ),
                      );
                    },
                  )
                ],
              )
            ],
          ),
          ),
        ),
    );
  }
}

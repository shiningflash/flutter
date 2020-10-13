import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    )
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 50),
          child: Column(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Welcome", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                  ),),
                  SizedBox(height: 20,),
                  Text("One of the leading Life Insurance Company in Bangladesh since 1990",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 15
                  ),),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/sandhani.png')
                  )
                ),
              ),
              Column(
                children: <Widget>[
                  MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {},
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.black
                      ),
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Text("Login",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.only(top: 3, left: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border(
                        bottom: BorderSide(color: Colors.black),
                        top: BorderSide(color: Colors.black),
                        left: BorderSide(color: Colors.black),
                        right: BorderSide(color: Colors.black),
                      )
                    ),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {},
                      color: Colors.yellow,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.black
                          ),
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Text("Sign up",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18
                        ),
                      ),
                    ),
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
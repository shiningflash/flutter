import 'package:animated_login_signup_pro/animation/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'login.dart';
import 'signup.dart';

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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 90),
            child: Column(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FadeAnimation(1.0,
                      Text("Welcome to", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    FadeAnimation(1.1,
                      Text("One of the leading Company in Bangladesh",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 15
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
              FadeAnimation(1.2, Container(
                    height: MediaQuery.of(context).size.height / 2.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/logo.png')
                      )
                    ),
                  ),
              ),
                SizedBox(height: 20,),
                Column(
                  children: <Widget>[
                    FadeAnimation(1.3,
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 55,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
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
                    ),
                    SizedBox(height: 20,),
                    FadeAnimation(1.4,
                      Container(
                        padding: EdgeInsets.only(top: 3, left: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border(
                            bottom: BorderSide(color: Colors.black),
                            top: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                          )
                        ),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 55,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SignupPage()),
                            );
                          },
                          color: Colors.yellow[700],
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              /*side: BorderSide(
                                  color: Colors.black
                              ),*/
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: Text("Sign up",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30, left: 3),
                      child: Text("Terms and conditions",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
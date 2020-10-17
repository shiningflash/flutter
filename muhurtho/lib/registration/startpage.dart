import 'package:muhurtho/animations/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:muhurtho/registration/login.dart';
import 'package:muhurtho/registration/signup.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            // height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 90),
            child: Column(
              children: <Widget>[
                headerSection(),
                SizedBox(height: 10,),
                FadeAnimation(1.2,
                  logoSection(context),
                ),
                SizedBox(height: 20,),
                Column(
                  children: <Widget>[
                    FadeAnimation(1.3,
                      loginButtonHandler(context),
                    ),
                    SizedBox(height: 20,),
                    FadeAnimation(1.4,
                      signupButtonHandler(context),
                    ),
                    termsButtonHandler(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column headerSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        FadeAnimation(1.0,
          Text("Welcome to", style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25
          ),
          ),
        ),
        SizedBox(height: 20,),
        FadeAnimation(1.1,
          Text("Muhurtho",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.grey[700],
                fontSize: 40
            ),
          ),
        ),
      ],
    );
  }

  Container logoSection(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/logo.png')
          )
      ),
    );
  }

  MaterialButton loginButtonHandler(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      height: 50,
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
    );
  }

  Container signupButtonHandler(BuildContext context) {
    return Container(
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
        height: 50,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignupPage()),
          );
        },
        color: Colors.yellow[700],
        elevation: 0,
        shape: RoundedRectangleBorder(
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
    );
  }

  Padding termsButtonHandler() {
    return Padding(
      padding: EdgeInsets.only(top: 30, left: 3),
      child: FadeAnimation(1.4, Text("Terms and conditions",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: Colors.grey[800],
        ),
      ),),
    );
  }
}
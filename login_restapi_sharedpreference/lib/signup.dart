import 'package:flutter/material.dart';
import 'animation/FadeAnimation.dart';
import 'package:flutter/services.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  TextEditingController emailController = new TextEditingController();
  TextEditingController passController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            height: MediaQuery.of(context).size.height - 50,
            width: double.infinity,
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(height: 10,),
                  headerSection(),
                  inputSection(),
                  signupButtonHandler(),
                  loginButtonHandler(),
                  footerSection(),
                ],
              ),
            ),
          ),

        ),
      ),
    );
  }

  Column headerSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FadeAnimation(1.0, Text("Sign Up", style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        ),),
        SizedBox(height: 15,),
        FadeAnimation(1.1, Text("Sign up for an account", style: TextStyle(
            fontSize: 15,
            color: Colors.grey[700]
        ),),),
      ],
    );
  }

  Column inputSection() {
    return Column(
      children: <Widget>[
        SizedBox(height: 20,),
        FadeAnimation(1.2, takeInput(label: "Email"),),
        FadeAnimation(1.3, takeInput(label: "Password", obscureText: true),),
        FadeAnimation(1.4, takeInput(label: "Confirm Password", obscureText: true),),
      ],
    );
  }

  Widget takeInput({label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(label, style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black87
        ),
        ),
        SizedBox(height: 10,),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400]),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400]),
              )
          ),
        ),
        SizedBox(height: 20,),
      ],
    );
  }

  Container signupButtonHandler() {
    return Container(
      child: FadeAnimation(1.6, Container(
        padding: EdgeInsets.only(top: 3, left: 3),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
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
          onPressed: () {},
          color: Colors.lightBlue,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
          ),
          child: Text("Signup",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.black
            ),
          ),
        ),
      ),),
    );
  }

  Column loginButtonHandler() {
    return Column(
      children: [
        FadeAnimation(1.7, Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Have an account?  "),
            Text("Login", style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18
            ),)
          ],
        ),),
      ],
    );
  }

  Column footerSection() {
    return Column(
      children: [
        FadeAnimation(1.8, Container(
          height: MediaQuery.of(context).size.height / 4,
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/bottom_pic_.png'),
                  fit: BoxFit.cover
              )
          ),
        ),),
      ],
    );
  }
}
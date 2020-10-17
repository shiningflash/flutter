// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:muhurtho/animations/FadeAnimation.dart';
import 'package:flutter/services.dart';
import 'package:muhurtho/models/user.dart';
import 'package:muhurtho/views/chat_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _isLoading = false;

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
            height: MediaQuery.of(context).size.height - 100,
            width: double.infinity,
            child: Expanded(
              child: _isLoading ? Center(
                  child: CircularProgressIndicator()) : Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(height: 10,),
                  headerSection(),
                  inputSection(),
                  loginButtonHandler(),
                  signupButtonHandler(),
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
        FadeAnimation(1.0,
          Text("Login", style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          ),
        ),
        SizedBox(height: 15,),
        FadeAnimation(1.1,
          Text("Log in to your account", style: TextStyle(
              fontSize: 15,
              color: Colors.grey[700]
          ),
          ),
        ),
      ],
    );
  }

  Column inputSection() {
    return Column(
      children: <Widget>[
        SizedBox(height: 20,),
        FadeAnimation(1.3, takeInput(),),
      ],
    );
  }

  Column takeInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Email", style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black87
        ),
        ),
        SizedBox(height: 10,),
        emailTextField(),
        SizedBox(height: 20,),
        Text("Password", style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black87
        ),
        ),
        SizedBox(height: 10,),
        passTextField(),
        SizedBox(height: 20,),
      ],
    );
  }

  TextField emailTextField() {
    return TextField(
      controller: emailController,
      obscureText: false,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[400]),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[400]),
          )
      ),
    );
  }

  TextField passTextField() {
    return TextField(
      controller: passController,
      obscureText: true,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[400]),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[400]),
          )
      ),
    );
  }

  loggingIn(String email, String pass) async {
    /*Map data = {
      'email': email,
      'pass': pass
    };
    String dataString = json.encode(data);
    Map<String, String> header = {
      'Content-type': 'application/json'
    };

    var jsonData = null;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String url = "http://127.0.0.1:8080/login"; // your url here
    var response = await http.post(url, body: dataString, headers: header);
    if (response.statusCode == 200) {
      jsonData = json.decode(response.body);
      setState(() {
        _isLoading = false;
        sharedPreferences.setString('token', jsonData['token']);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => HomePage()
            ),
                (Route<dynamic> route) => false
        );
      });
      print(response.body);
    }
    else {
      print(response.body);
    }
    setState(() {
      _isLoading = false;
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (BuildContext context) => ChatScreen()
          ),
              (Route<dynamic> route) => false
      );
    }); */

    final User muhurtho = User(
      id: 2,
      name: 'Muhurtho',
      imageUrl: 'assets/images/logo.jpg',
    );

    _isLoading = false;
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (BuildContext context) => ChatScreen(user: muhurtho,)
        ),
            (Route<dynamic> route) => false
    );
  }

  Container loginButtonHandler() {
    return Container(
      child: FadeAnimation(1.5, Container(
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
          height: 50,
          onPressed: () {
            setState(() {
              _isLoading = true;
            });
            loggingIn(emailController.text, passController.text);
          },
          color: Colors.yellow[700],
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
          ),
          child: Text("Login",
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

  Container signupButtonHandler() {
    return Container(
      child: FadeAnimation(1.6, Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Don't have an account?  "),
              Text("Sign up", style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
              ),
            ],
          ),
        ],
      ),),
    );
  }

  Column footerSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        //SizedBox(height: 55,),
        FadeAnimation(1.7, Container(
          height: MediaQuery.of(context).size.height / 5,
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bottom_pic_.png'),
                  fit: BoxFit.cover
              )
          ),
        ),),
      ],
    );
  }
}

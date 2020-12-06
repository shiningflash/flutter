import 'package:data_collection_app/user.dart';
import 'package:flutter/material.dart';

String _name_field = 'Enter your name:';
String _dob_field = 'Enter your date of birth:';
String _occupation_field = 'Enter your occupation:';
String _location_field = 'Enter your location:';

class InsertData extends StatefulWidget {
  @override
  _InsertDataState createState() => _InsertDataState();
}

class _InsertDataState extends State<InsertData> {

  final TextStyle _textStyle = TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.normal);

  final GlobalKey<FormState> formkey = GlobalKey <FormState>();

  User user;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber[900],
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_outlined),
              onPressed: () {
                Navigator.of(context).pop();
              }
          ),
          title: Text(
            'Insert new data',
          ),
        ),
        body: Container(
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
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Flexible(
                    flex: 0,
                    child: Center(
                      child: Form(
                        child: Flex(
                          direction: Axis.vertical,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(_name_field, style: _textStyle,),
                              ],
                            ),
                            TextFormField(
                              initialValue: '',
                              validator: (value) => value.isEmpty ?
                                '*Required': null,
                              onSaved: (newValue) => user.name = newValue,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(_dob_field, style: _textStyle,),
                              ],
                            ),
                            TextFormField(
                              initialValue: '',
                              validator: (value) => value.isEmpty ?
                              '*Required': null,
                              onSaved: (newValue) => user.dob = newValue,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(_occupation_field, style: _textStyle,),
                              ],
                            ),
                            TextFormField(
                              initialValue: '',
                              validator: (value) => value.isEmpty ?
                              '*Required': null,
                              onSaved: (newValue) => user.occupation = newValue,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(_location_field, style: _textStyle,),
                              ],
                            ),
                            TextFormField(
                              initialValue: '',
                              validator: (value) => value.isEmpty ?
                              '*Required': null,
                              onSaved: (newValue) => user.location = newValue,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            RaisedButton(
                              onPressed: () {},
                              color: Colors.amber[900],
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

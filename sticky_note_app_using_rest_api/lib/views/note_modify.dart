import 'package:flutter/material.dart';
import 'note_list.dart';

class NoteModify extends StatelessWidget {

  final String noteId;
  bool get isEditing => noteId != null;

  NoteModify({this.noteId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? "Edit Note" : "Create Note"),
        backgroundColor: Colors.black54,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          children: <Widget>[
            takeInput(),
            SizedBox(height: 10,),
            submitButtonHandler(context),
          ],
        ),
      ),
    );
  }

  Column takeInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Title:", style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black87
        ),
        ),
        SizedBox(height: 10,),
        titleTextField(),
        SizedBox(height: 20,),
        Text("Content:", style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black87
        ),
        ),
        SizedBox(height: 10,),
        contentTextField(),
        SizedBox(height: 20,),
      ],
    );
  }

  TextField titleTextField() {
    return TextField(
      // controller: emailController,
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

  TextField contentTextField() {
    return TextField(
      // controller: passController,
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

  SizedBox submitButtonHandler(BuildContext context) {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: RaisedButton(
        child: Text(
          "Submit",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pop();
          /*if (isEditing) {
            // update note in api
          } else {
            // create note in api
          }*/
        },
        color: Colors.black54,
      ),
    );
  }
}

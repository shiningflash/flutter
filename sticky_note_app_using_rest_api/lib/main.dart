import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sticky_note_app_using_rest_api/services/notes_service.dart';
import 'package:sticky_note_app_using_rest_api/views/note_list.dart';

void setUpLocator() {
  GetIt.instance.registerLazySingleton(() => NotesService());
}

void main() {
  setUpLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NoteList(title: 'Your Notes'),
    );
  }
}
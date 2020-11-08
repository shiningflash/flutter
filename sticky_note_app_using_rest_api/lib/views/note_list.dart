import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sticky_note_app_using_rest_api/model/note.dart';
import 'package:sticky_note_app_using_rest_api/services/notes_service.dart';
import 'package:sticky_note_app_using_rest_api/views/note_delete.dart';
import 'package:sticky_note_app_using_rest_api/views/note_modify.dart';

class NoteList extends StatefulWidget {
  NoteList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NoteList createState() => _NoteList();
}

class _NoteList extends State<NoteList> {

  NotesService get service => GetIt.instance<NotesService>();

  List<Note> notes = [];

  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  void initState() {
    notes = service.getNoteList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: new Text(
            widget.title,
            textAlign: TextAlign.center,
        ),
        leading: new IconButton(
          icon: new Icon(Icons.event_note_sharp),
          onPressed: () {},
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black54,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => NoteModify()));
        },
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
        separatorBuilder: (_, __) => Divider(height: 1, color: Colors.black54,),
        itemBuilder: (_, index) {
          return Dismissible(
            key: ValueKey(notes[index].noteId),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {
              // work on later
            },
            confirmDismiss: (direction) async {
              final result = await showDialog(
                context: context,
                builder: (_) => NoteDelete()
              );
              return result;
            },
            background: Container(
              color: Colors.red,
              padding: EdgeInsets.only(left: 16),
              child: Align(
                child: Icon(Icons.delete,
                  color: Colors.white,),
                  alignment: Alignment.centerLeft,
                ),
            ),
            child: ListTile(
              title: Text(
                notes[index].noteTitle,
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold
                ),
              ),
              subtitle: Text('Last edited on ${formatDateTime(notes[index].latestEditDateTime)}'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => NoteModify(noteId: notes[index].noteId,)));
              },
            ),
          );
        },
        itemCount: notes.length,
      ),
    );
  }
}

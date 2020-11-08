import 'package:sticky_note_app_using_rest_api/model/note.dart';

class NotesService {

  List<Note> getNoteList() {
    return [
      new Note(
          noteId: "1",
          createDateTime: DateTime.now(),
          latestEditDateTime: DateTime.now(),
          noteTitle: "This is note 1."
      ),
      new Note(
          noteId: "2",
          createDateTime: DateTime.now(),
          latestEditDateTime: DateTime.now(),
          noteTitle: "This is note 2."
      ),
      new Note(
          noteId: "3",
          createDateTime: DateTime.now(),
          latestEditDateTime: DateTime.now(),
          noteTitle: "This is note 4."
      ),
      new Note(
          noteId: "4",
          createDateTime: DateTime.now(),
          latestEditDateTime: DateTime.now(),
          noteTitle: "This is note 4."
      ),
    ];
  }

}
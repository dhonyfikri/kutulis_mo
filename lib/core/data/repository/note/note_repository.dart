import 'package:kutulis_mo/core/model/note/note_model.dart';

abstract class NoteRepository {
  List<NoteModel> getNotes(String? search);

  void saveNote(NoteModel note);

  void deleteNote(String id);
}

import 'package:kutulis_mo/core/data/app_preference.dart';
import 'package:kutulis_mo/core/model/note/note_list_model.dart';

class LocalNoteService extends AppPreference {
  LocalNoteService(super.getStorage);

  static const _notesKey = 'notes';

  NoteListModel getNoteListData() {
    try {
      var json = storage.read(_notesKey) ?? '';
      var data = NoteListModel.fromJson(json);
      return data;
    } catch (e) {
      return NoteListModel();
    }
  }

  void saveNote(NoteListModel noteData) {
    try {
      var json = noteData.toJson();
      storage.write(_notesKey, json);
    } catch (e) {
      // nothing
    }
  }
}

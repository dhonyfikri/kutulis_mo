import 'package:intl/intl.dart';
import 'package:kutulis_mo/core/data/repository/note/note_repository.dart';
import 'package:kutulis_mo/core/data/service/local/local_note_service.dart';
import 'package:kutulis_mo/core/model/note/note_list_model.dart';
import 'package:kutulis_mo/core/model/note/note_model.dart';

class NoteRepositoryImpl extends NoteRepository {
  LocalNoteService localNoteService;

  NoteRepositoryImpl({
    required this.localNoteService,
  });

  @override
  List<NoteModel> getNotes(String? search) {
    var data = localNoteService.getNoteListData();
    var notes = data.data ?? [];

    DateFormat format = DateFormat("d MMMM yyyy HH:mm:ss", "id_ID");
    notes.sort((a, b) {
      DateTime date1;
      try {
        date1 = format.parse(a.lastModified ?? "-");
      } catch (e) {
        date1 = DateTime.now();
      }

      DateTime date2;
      try {
        date2 = format.parse(b.lastModified ?? "-");
      } catch (e) {
        date2 = DateTime.now();
      }

      return date2.compareTo(date1);
    });

    print("search: $search");

    if (search != null && search.isNotEmpty) {
      List<NoteModel> filteredNotes = [];
      for (var x in notes) {
        String? titleUpper = x.title?.toUpperCase();
        String? noteUpper = x.note?.toUpperCase();

        var match =
            (titleUpper != null && titleUpper.contains(search.toUpperCase())) ||
                (noteUpper != null && noteUpper.contains(search.toUpperCase()));

        if (match) {
          filteredNotes.add(x);
        }
      }
      return filteredNotes;
    }

    return notes;
  }

  @override
  void saveNote(NoteModel note) {
    var notes = getNotes(null);
    notes.removeWhere((x) => x.id == note.id);
    notes.add(note);
    var data = NoteListModel(data: notes);
    localNoteService.saveNote(data);
  }

  @override
  void deleteNote(String id) {
    var notes = getNotes(null);
    notes.removeWhere((x) => x.id == id);
    var data = NoteListModel(data: notes);
    localNoteService.saveNote(data);
  }
}

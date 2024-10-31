import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kutulis_mo/core/data/repository/note/note_repository.dart';
import 'package:kutulis_mo/core/model/note/note_model.dart';
import 'package:uuid/uuid.dart';

class NoteEditorScreenController extends GetxController {
  NoteRepository noteRepository;

  NoteEditorScreenController({
    required this.noteRepository,
  });

  late TextEditingController titleController;
  late TextEditingController noteController;

  final characterCounts = Rx<int>(0);

  late NoteModel note;

  @override
  void onInit() {
    super.onInit();

    titleController = TextEditingController();
    noteController = TextEditingController();

    if (Get.arguments is NoteModel) {
      note = Get.arguments;
    } else {
      DateTime now = DateTime.now();
      String formattedDate =
          DateFormat("d MMMM yyyy HH:mm:ss", "id_ID").format(now);
      note = NoteModel(
        id: const Uuid().v4(),
        title: "",
        note: "",
        lastModified: formattedDate,
      );
    }

    titleController.text = note.title ?? "";
    noteController.text = note.note ?? "";
    characterCounts.value = note.note?.length ?? 0;

    titleController.addListener(_saveChanges);
    noteController.addListener(_saveChanges);
    FocusScope.of(Get.context!).unfocus();
  }

  @override
  void dispose() {
    titleController.removeListener(_saveChanges);
    noteController.removeListener(_saveChanges);
    titleController.dispose();
    noteController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    note.title = titleController.text;
    note.note = noteController.text;

    DateTime now = DateTime.now();
    String formattedDate =
        DateFormat("d MMMM yyyy HH:mm:ss", "id_ID").format(now);
    note.lastModified = formattedDate;

    noteRepository.saveNote(note);
    characterCounts.value = note.note?.length ?? 0;
  }

  Future deleteNote() async {
    noteRepository.deleteNote(note.id ?? "");
    Get.back();
  }
}

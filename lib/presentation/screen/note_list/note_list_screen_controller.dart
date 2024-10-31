import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kutulis_mo/app/app_routes.dart';
import 'package:kutulis_mo/core/data/repository/note/note_repository.dart';
import 'package:kutulis_mo/core/model/note/note_model.dart';

class NoteListScreenController extends GetxController {
  NoteRepository noteRepository;

  NoteListScreenController({
    required this.noteRepository,
  });

  late TextEditingController searchController;

  final notes = Rx<List<NoteModel>>([]);

  Future<void> getNotes() async {
    var search = searchController.text;
    var data = noteRepository.getNotes(search);
    notes.value = data;
  }

  Future<void> goToEditor(NoteModel? note) async {
    await Get.toNamed(AppRoute.noteEditor, arguments: note);
    FocusScope.of(Get.context!).unfocus();
    getNotes();
  }

  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
    searchController.addListener(getNotes);
    getNotes();
  }

  @override
  void dispose() {
    searchController.removeListener(getNotes);
    super.dispose();
  }

  void onResume() {
    getNotes();
  }
}

import 'package:get/get.dart';
import 'package:kutulis_mo/core/data/repository/note/note_repository.dart';
import 'package:kutulis_mo/presentation/screen/note_editor/note_editor_screen_controller.dart';
import 'package:kutulis_mo/presentation/screen/note_list/note_list_screen_controller.dart';

class ControllerModule extends Bindings {
  @override
  Future<void> dependencies() async {
    /// ========================================================================
    /// Find Repository
    /// ========================================================================

    final noteRepository = Get.find<NoteRepository>();

    /// ========================================================================
    /// Screen and Component
    /// ========================================================================

    // Splash Controller -------------------------------------------------------
    // Get.lazyPut<SplashScreenController>(
    //   () => SplashScreenController(
    //     authRepository: authRepository,
    //   ),
    // );

    // Note List Controller -------------------------------------------------------
    Get.lazyPut<NoteListScreenController>(
      () => NoteListScreenController(noteRepository: noteRepository),
    );

    // Note Editor Controller -------------------------------------------------------
    Get.lazyPut<NoteEditorScreenController>(
      () => NoteEditorScreenController(noteRepository: noteRepository),
    );
  }
}

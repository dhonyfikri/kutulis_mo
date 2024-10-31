import 'package:get/get.dart';
import 'package:kutulis_mo/core/data/repository/note/note_repository.dart';
import 'package:kutulis_mo/core/data/repository/note/note_repository_impl.dart';
import 'package:kutulis_mo/core/data/service/local/local_note_service.dart';

class RepositoryModule with Bindings {
  @override
  Future<void> dependencies() async {
    // Find Local Service
    final localNoteService = Get.find<LocalNoteService>();

    // Find Remote Service =====================================================
    // final remoteAuthService = Get.find<RemoteAuthService>();

    // Note Repository =========================================================
    Get.lazyPut<NoteRepository>(
      () => NoteRepositoryImpl(
        localNoteService: localNoteService,
      ),
    );
  }
}

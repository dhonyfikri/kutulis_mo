import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kutulis_mo/core/data/service/local/local_note_service.dart';

class LocalModule with Bindings {
  @override
  Future<void> dependencies() async {
    final localNoteService = LocalNoteService(GetStorage());

    // Local Note Service
    Get.lazyPut<LocalNoteService>(() => localNoteService);
  }
}

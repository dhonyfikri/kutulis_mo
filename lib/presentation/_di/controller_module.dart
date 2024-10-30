import 'package:get/get.dart';
import 'package:kutulis_mo/presentation/screen/note_list/note_list_screen_controller.dart';

class ControllerModule extends Bindings {
  @override
  Future<void> dependencies() async {
    /// ========================================================================
    /// Find Repository
    /// ========================================================================

    // final authRepository = Get.find<AuthRepository>();

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
      () => NoteListScreenController(),
    );
  }
}

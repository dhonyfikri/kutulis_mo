import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:kutulis_mo/app/app_routes.dart';
import 'package:kutulis_mo/presentation/_di/controller_module.dart';
import 'package:kutulis_mo/presentation/screen/note_list/note_list_screen.dart';

class AppPages {
  AppPages._();

  static final List<GetPage> pages = [
    GetPage(
      name: AppRoute.noteList,
      page: () => const NoteListScreen(),
      transition: Transition.cupertino,
      binding: ControllerModule(),
    ),
  ];
}

// dart run build_runner build --delete-conflicting-outputs
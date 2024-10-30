import 'package:flutter/material.dart';
import 'package:kutulis_mo/app/base/base_view.dart';
import 'package:kutulis_mo/app/resources/app_fonts.dart';
import 'package:kutulis_mo/presentation/screen/note_list/note_list_screen_controller.dart';

class NoteListScreen extends BaseView<NoteListScreenController> {
  const NoteListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child:
                Text("Note List Page", style: AppFonts.blackRegularTextStyle),
          ),
        ),
      ),
    );
  }
}

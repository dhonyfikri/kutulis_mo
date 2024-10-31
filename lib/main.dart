import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:kutulis_mo/app/app_pages.dart';
import 'package:kutulis_mo/app/app_routes.dart';
import 'package:kutulis_mo/app/resources/app_theme.dart';
import 'package:kutulis_mo/core/data/_di/local_module.dart';
import 'package:kutulis_mo/core/data/_di/repository_module.dart';
import 'package:kutulis_mo/presentation/_di/controller_module.dart';
import 'package:kutulis_mo/utils/logger.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await dotenv.load(fileName: '.env');

    await GetStorage.init();

    await LocalModule().dependencies();
    await RepositoryModule().dependencies();
    await ControllerModule().dependencies();
    await initializeDateFormatting('id_ID');

    runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: kDebugMode,
        enableLog: kDebugMode,
        title: "Kutulis Mo",
        theme: AppTheme.light,
        getPages: AppPages.pages,
        initialRoute: AppRoute.noteList,
      ),
    );
  } catch (error) {
    logger.d('MAIN ERROR: $error');
  }
}

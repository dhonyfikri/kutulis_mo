import 'package:get/get.dart';

class RepositoryModule with Bindings {
  @override
  Future<void> dependencies() async {
    // Find Local Service
    // final localAuthService = Get.find<LocalAuthService>();

    // Find Remote Service =====================================================
    // final remoteAuthService = Get.find<RemoteAuthService>();

    // Auth Repository =========================================================
    // Get.lazyPut<AuthRepository>(
    //   () => AuthRepositoryImpl(
    //     remoteAuthService: remoteAuthService,
    //     localAuthService: localAuthService,
    //   ),
    // );
  }
}

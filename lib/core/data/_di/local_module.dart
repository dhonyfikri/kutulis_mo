import 'package:get/get.dart';

class LocalModule with Bindings {
  @override
  Future<void> dependencies() async {
    // final localAuthService = LocalAuthService(GetStorage());

    // Local Auth Service
    // Get.lazyPut<LocalAuthService>(() => localAuthService);
  }
}

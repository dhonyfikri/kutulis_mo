import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kutulis_mo/core/mixin/custom_toast_mixin.dart';
import 'package:kutulis_mo/presentation/custom_view/dialog/loading_dialog.dart';

abstract class BaseView<T> extends GetView<T> with CustomToastMixin {
  const BaseView({super.key});

  @protected
  void showLoading() {
    // Replace with loading widget
    Get.dialog(
      const LoadingDialog(
        title: 'Loading..',
        description: 'Please wait a second..',
      ),
    );
  }

  @protected
  Future<void> hideLoading() async {
    // await Future.delayed(const Duration(seconds: 1));
    // Hide loading widget
    if (Get.isDialogOpen == true) {
      Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
    }
  }

  @protected
  void showErrorDialog(String message) {
    // Show error dialog widget
    toastError(title: 'Error', message: message);
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kutulis_mo/app/resources/app_colors.dart';

mixin CustomToastMixin {
  void toastError({
    required String title,
    required String message,
    Duration? duration = const Duration(seconds: 5),
    double? pading,
  }) {
    Get.snackbar(
      title,
      message,
      backgroundColor: AppColors.error,
      colorText: Colors.white,
      duration: duration,
    );
  }

  void toastSuccess({
    required String title,
    required String message,
    Duration? duration = const Duration(seconds: 5),
  }) {
    Get.snackbar(
      title,
      message,
      backgroundColor: AppColors.success,
      colorText: Colors.white,
      duration: duration,
    );
  }

  void toastInfo({
    required String title,
    required String message,
    Duration? duration = const Duration(seconds: 5),
  }) {
    Get.snackbar(
      title,
      message,
      backgroundColor: AppColors.info,
      colorText: Colors.white,
      duration: duration,
    );
  }
}

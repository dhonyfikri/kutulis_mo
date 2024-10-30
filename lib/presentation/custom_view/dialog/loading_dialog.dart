import 'package:flutter/material.dart';
import 'package:kutulis_mo/app/resources/app_dimens.dart';
import 'package:kutulis_mo/app/resources/app_fonts.dart';
import 'package:kutulis_mo/app/resources/app_images.dart';
import 'package:kutulis_mo/presentation/custom_view/dialog/base_dialog.dart';
import 'package:kutulis_mo/presentation/custom_view/image_viewer/image_viewer.dart';
import 'package:kutulis_mo/utils/spacing_utils.dart';

class LoadingDialog extends BaseDialog {
  final String? title;
  final String? description;

  const LoadingDialog({
    super.key,
    super.dismissOnOuterClicked = false,
    super.dismissOnBackPressed = false,
    super.onOuterClicked,
    this.title,
    this.description,
  });

  @override
  Widget? buildChild(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.paddingBig),
      child: Container(
        width: 1.screenWidth(context),
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.padding,
          vertical: AppDimens.paddingBig,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppDimens.radius),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ImageViewer(
              source: AppImages.loadingImage,
              width: 0.26.screenWidth(context),
            ),
            AppDimens.padding.verticalSpace,
            Text(
              title ?? '',
              textAlign: TextAlign.center,
              style: AppFonts.blackBoldTextStyle.copyWith(
                fontSize: AppDimens.textXL,
              ),
            ),
            6.verticalSpace,
            Text(
              description ?? '',
              textAlign: TextAlign.center,
              style: AppFonts.blackLightTextStyle.copyWith(
                fontSize: AppDimens.textS,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

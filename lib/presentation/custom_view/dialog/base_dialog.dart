import 'package:flutter/material.dart';
import 'package:kutulis_mo/app/resources/app_colors.dart';

class BaseDialog extends StatelessWidget {
  final Widget? child;
  final bool dismissOnBackPressed;
  final bool dismissOnOuterClicked;
  final VoidCallback? onOuterClicked;

  const BaseDialog({
    super.key,
    this.child,
    this.dismissOnOuterClicked = true,
    this.dismissOnBackPressed = true,
    this.onOuterClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      backgroundColor: AppColors.transparent,
      child: PopScope(
        canPop: dismissOnBackPressed,
        child: GestureDetector(
          onTap: () {
            onOuterClicked?.call();
            if (dismissOnOuterClicked) {
              Navigator.of(context).pop();
            }
          },
          child: Scaffold(
            backgroundColor: AppColors.transparent,
            body: Center(
              child: buildChild(context) ?? const SizedBox.shrink(),
            ),
          ),
        ),
      ),
    );
  }

  Widget? buildChild(BuildContext context) {
    return child;
  }
}

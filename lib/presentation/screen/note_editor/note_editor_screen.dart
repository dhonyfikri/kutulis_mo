import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kutulis_mo/app/base/base_view.dart';
import 'package:kutulis_mo/app/resources/app_colors.dart';
import 'package:kutulis_mo/app/resources/app_dimens.dart';
import 'package:kutulis_mo/app/resources/app_fonts.dart';
import 'package:kutulis_mo/presentation/custom_view/text_field/text_field.dart';
import 'package:kutulis_mo/presentation/screen/note_editor/note_editor_screen_controller.dart';
import 'package:kutulis_mo/utils/spacing_utils.dart';

class NoteEditorScreen extends BaseView<NoteEditorScreenController> {
  const NoteEditorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: AppColors.lighterGray,
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(AppDimens.bigRadius),
                      ),
                      child: Material(
                        color: AppColors.transparent,
                        child: InkWell(
                          onTap: Get.back,
                          splashColor: AppColors.transparent,
                          child: const Padding(
                            padding: EdgeInsets.all(12),
                            child: Icon(Icons.arrow_back),
                          ),
                        ),
                      ),
                    ),
                    12.horizontalSpace,
                    ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(AppDimens.bigRadius),
                      ),
                      child: Material(
                        color: AppColors.transparent,
                        child: InkWell(
                          onTap: controller.deleteNote,
                          splashColor: AppColors.transparent,
                          child: const Padding(
                            padding: EdgeInsets.all(12),
                            child: Icon(
                              Icons.delete,
                              color: AppColors.accent700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: controller.titleController,
                        fontSize: AppDimens.textXXL,
                        borderColor: AppColors.transparent,
                        focussedBorderColor: AppColors.transparent,
                        borderRadius: 0,
                        padding: const EdgeInsets.all(0),
                        boldText: false,
                        placeholder: "Insert Title...",
                        maxLines: 1,
                        backgroundColor: AppColors.transparent,
                        placeholderStyle: AppFonts.grayLightTextStyle.copyWith(
                          fontSize: AppDimens.textXXL,
                        ),
                      ),
                      4.verticalSpace,
                      Row(
                        children: [
                          Text(
                            controller.note.lastModified ?? "-",
                            style: AppFonts.grayLightTextStyle.copyWith(
                              fontSize: AppDimens.textS,
                            ),
                          ),
                          8.horizontalSpace,
                          Container(
                            height: 14,
                            width: 1,
                            decoration: const BoxDecoration(
                              color: AppColors.gray,
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  AppDimens.bigRadius,
                                ),
                              ),
                            ),
                          ),
                          8.horizontalSpace,
                          Obx(
                            () => Text(
                              "${controller.characterCounts.value} Character${controller.characterCounts.value > 0 ? "s" : ""}",
                              style: AppFonts.grayLightTextStyle.copyWith(
                                fontSize: AppDimens.textS,
                              ),
                            ),
                          ),
                        ],
                      ),
                      12.verticalSpace,
                      Expanded(
                        child: CustomTextField(
                          controller: controller.noteController,
                          backgroundColor: AppColors.transparent,
                          expands: true,
                          borderColor: AppColors.transparent,
                          focussedBorderColor: AppColors.transparent,
                          borderRadius: 0,
                          padding: const EdgeInsets.all(0),
                          placeholder: "Your note here...",
                          placeholderStyle: AppFonts.grayLightTextStyle,
                          textAlignVertical: TextAlignVertical.top,
                          keyboardType: TextInputType.multiline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

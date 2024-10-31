import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kutulis_mo/app/base/base_view.dart';
import 'package:kutulis_mo/app/resources/app_colors.dart';
import 'package:kutulis_mo/app/resources/app_dimens.dart';
import 'package:kutulis_mo/app/resources/app_fonts.dart';
import 'package:kutulis_mo/presentation/custom_view/text_field/text_field.dart';
import 'package:kutulis_mo/presentation/screen/note_list/note_list_screen_controller.dart';
import 'package:kutulis_mo/utils/spacing_utils.dart';

class NoteListScreen extends BaseView<NoteListScreenController> {
  const NoteListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.goToEditor(null),
        child: const Icon(
          Icons.add,
          color: AppColors.white,
        ),
      ),
      body: SafeArea(
        child: Container(
          color: AppColors.lighterGray,
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              8.verticalSpace,
              CustomTextField(
                controller: controller.searchController,
                backgroundColor: AppColors.transparent,
                borderColor: AppColors.transparent,
                focussedBorderColor: AppColors.transparent,
                borderRadius: 0,
                padding: const EdgeInsets.all(0),
                placeholder: "Search...",
                placeholderStyle: AppFonts.grayLightTextStyle,
                suffixIcon: IconButton(
                  splashColor: Colors.transparent,
                  icon: const Icon(Icons.search),
                  onPressed: controller.getNotes,
                ),
                onTapOutside: (_) {
                  FocusScope.of(context).unfocus();
                },
              ),
              Container(
                width: double.infinity,
                height: 2,
                decoration: const BoxDecoration(
                  color: AppColors.lightGray,
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppDimens.bigRadius),
                  ),
                ),
              ),
              Expanded(
                child: RefreshIndicator(
                  color: AppColors.primary,
                  onRefresh: () => Future.sync(controller.getNotes),
                  child: SizedBox(
                    height: double.infinity,
                    child: ScrollConfiguration(
                      behavior:
                          const ScrollBehavior().copyWith(overscroll: false),
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Column(
                          children: [
                            20.verticalSpace,
                            SizedBox(
                              width: double.infinity,
                              child: Obx(
                                () => Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  alignment: WrapAlignment.start,
                                  children: controller.notes.value
                                      .map(
                                        (note) => ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(AppDimens.radius),
                                          ),
                                          child: Material(
                                            color: AppColors.white,
                                            child: InkWell(
                                              onTap: () =>
                                                  controller.goToEditor(note),
                                              splashColor: AppColors.splash,
                                              child: Container(
                                                width: (1.screenWidth(context) -
                                                        48) /
                                                    2,
                                                height: 176,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 16,
                                                  vertical: 12,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      (note.title?.isNotEmpty ??
                                                              false)
                                                          ? note.title!
                                                          : "Untitled",
                                                      style: AppFonts
                                                          .blackRegularTextStyle
                                                          .copyWith(
                                                        fontSize:
                                                            AppDimens.textL,
                                                      ),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    12.verticalSpace,
                                                    Text(
                                                      note.note ?? "",
                                                      style: AppFonts
                                                          .blackLightTextStyle,
                                                      maxLines: 5,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    const Expanded(
                                                        child:
                                                            SizedBox.shrink()),
                                                    Text(
                                                      note.lastModified ?? "-",
                                                      style: AppFonts
                                                          .grayLightTextStyle
                                                          .copyWith(
                                                        fontSize:
                                                            AppDimens.textS,
                                                      ),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            ),
                            20.verticalSpace,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

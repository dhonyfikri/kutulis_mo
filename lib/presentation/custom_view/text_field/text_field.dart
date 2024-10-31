import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kutulis_mo/app/resources/app_colors.dart';
import 'package:kutulis_mo/app/resources/app_dimens.dart';
import 'package:kutulis_mo/app/resources/app_fonts.dart';

class CustomTextField<T> extends StatelessWidget {
  // Common properties
  final bool enabled,
      obscure,
      autofocus,
      isDense,
      showCursor,
      boldText,
      expands,
      enableSelection;
  final String? label, suffixText, placeholder, errorText;
  final Widget? prefixIcon, suffixIcon;
  final int? maxLines, maxLength;
  final int minLines;
  final TextInputType keyboardType;
  final ValueChanged<T?>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final FormFieldValidator<T>? optionValidator;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? labelStyle, placeholderStyle;
  final EdgeInsets? padding;
  final double borderRadius, fontSize, elevation;
  final Color borderColor, backgroundColor;
  final Color focussedBorderColor;
  final TextInputAction? textInputAction;
  final VoidCallback? onTap;
  final Function(PointerDownEvent event)? onTapOutside;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;
  final FocusNode? focusNode;
  final VoidCallback? onEditingComplete;
  final bool autocorrect;
  final bool readOnly;
  final bool isRequired;

  // Dropdown specific properties
  final List<T>? options;
  final T? selectedOption;
  final Widget Function(T item)? optionItemBuilder;

  // Main constructor for regular text field
  const CustomTextField({
    super.key,
    this.enabled = true,
    this.obscure = false,
    this.autofocus = false,
    this.isDense = false,
    this.showCursor = true,
    this.boldText = false,
    this.expands = false,
    this.enableSelection = true,
    this.label,
    this.suffixText,
    this.placeholder,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines,
    this.maxLength,
    this.minLines = 1,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.controller,
    this.inputFormatters,
    this.labelStyle,
    this.placeholderStyle,
    this.padding,
    this.borderRadius = AppDimens.bigRadius,
    this.borderColor = AppColors.lightGray,
    this.backgroundColor = Colors.white,
    this.focussedBorderColor = AppColors.primary,
    this.fontSize = 16.0,
    this.elevation = 0.0,
    this.textInputAction,
    this.onTap,
    this.onTapOutside,
    this.textAlign,
    this.textAlignVertical,
    this.focusNode,
    this.onEditingComplete,
    this.autocorrect = false,
    this.readOnly = false,
    // Dropdown is not used for normal text field
    this.options,
    this.optionValidator,
    this.selectedOption,
    this.optionItemBuilder,
    this.isRequired = false,
  });

  // Named constructor for dropdown field (CustomTextField.option)
  const CustomTextField.option({
    super.key,
    this.enabled = true,
    this.label,
    this.errorText,
    this.suffixIcon,
    required this.options,
    required this.selectedOption,
    required this.onChanged,
    this.optionItemBuilder,
    this.borderRadius = 8.0,
    this.borderColor = AppColors.lightGray,
    this.backgroundColor = Colors.white,
    this.focussedBorderColor = AppColors.primary,
    this.elevation = 0.0,
    this.isDense = false,
    this.padding,
    this.placeholder,
    this.optionValidator,
    // Unused properties for dropdown
    this.obscure = false,
    this.autofocus = false,
    this.showCursor = false,
    this.boldText = false,
    this.expands = false,
    this.enableSelection = false,
    this.suffixText,
    this.prefixIcon,
    this.maxLines,
    this.maxLength,
    this.minLines = 1,
    this.keyboardType = TextInputType.none,
    this.onFieldSubmitted,
    this.validator,
    this.controller,
    this.inputFormatters,
    this.labelStyle,
    this.placeholderStyle,
    this.fontSize = 16.0,
    this.textInputAction,
    this.onTap,
    this.onTapOutside,
    this.textAlign,
    this.textAlignVertical,
    this.focusNode,
    this.onEditingComplete,
    this.autocorrect = false,
    this.readOnly = false,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      color: AppColors.transparent,
      borderRadius: BorderRadius.circular(borderRadius),
      child: expands
          ? Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (label != null) _buildLabel(),
                  options != null
                      ? Expanded(
                          child: _buildDropdownField(),
                        ) // Dropdown field if options are present
                      : Expanded(
                          child: _buildTextFormField(),
                        ), // Regular text field otherwise
                ],
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (label != null) _buildLabel(),
                options != null
                    ? _buildDropdownField() // Dropdown field if options are present
                    : _buildTextFormField(), // Regular text field otherwise
              ],
            ),
    );
  }

  // Builds the TextFormField for regular text input
  Widget _buildTextFormField() {
    return TextFormField(
      readOnly: readOnly,
      enabled: enabled,
      controller: controller,
      obscureText: obscure,
      keyboardType: keyboardType,
      onChanged: (val) => onChanged?.call(val as T),
      textInputAction: textInputAction,
      autocorrect: autocorrect,
      onFieldSubmitted: onFieldSubmitted,
      maxLines: expands
          ? null
          : obscure
              ? 1
              : maxLines,
      minLines: expands ? null : minLines,
      expands: expands,
      maxLength: maxLength,
      showCursor: showCursor,
      enableInteractiveSelection: enableSelection,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autofocus: autofocus,
      focusNode: focusNode,
      validator: validator,
      inputFormatters: inputFormatters,
      style: AppFonts.blackLightTextStyle.copyWith(
        fontSize: fontSize,
        fontWeight: boldText ? FontWeight.bold : FontWeight.normal,
      ),
      textAlign: textAlign ?? TextAlign.start,
      textAlignVertical: textAlignVertical,
      onTap: onTap,
      onTapOutside: onTapOutside,
      decoration: _inputDecoration(),
      onEditingComplete: onEditingComplete,
    );
  }

  // Builds the DropdownButtonFormField for option selection
  Widget _buildDropdownField() {
    return ButtonTheme(
      alignedDropdown: true,
      child: DropdownButtonFormField<T>(
        value: selectedOption,
        icon: suffixIcon,
        hint: Text(
          placeholder ?? "Select",
          style: placeholderStyle ??
              const TextStyle(
                color: AppColors.gray,
                fontSize: AppDimens.textS,
              ),
        ),
        decoration: _inputDecoration(),
        onChanged: onChanged,
        isExpanded: true,
        validator: optionValidator,
        items: options!.map((T value) {
          return DropdownMenuItem<T>(
            value: value,
            child: optionItemBuilder != null
                ? optionItemBuilder!(value)
                : Text(
                    value.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppFonts.blackRegularTextStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
          );
        }).toList(),
      ),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      isDense: isDense,
      prefixIconConstraints: prefixIcon != null ? null : const BoxConstraints(),
      counterText: "",
      contentPadding: padding ??
          (options?.isNotEmpty == true
              ? const EdgeInsets.only(
                  left: -2,
                  top: 12,
                  right: 6,
                  bottom: 12,
                )
              : const EdgeInsets.only(
                  left: 12,
                  top: 12,
                  right: 12,
                  bottom: 12,
                )),
      hintText: placeholder,
      hintStyle: placeholderStyle ??
          const TextStyle(
            color: AppColors.gray,
            fontSize: AppDimens.textS,
          ),
      filled: true,
      fillColor: enabled ? backgroundColor : AppColors.transparent,
      prefixIcon: _buildPrefixIcon(),
      suffixIcon: options != null ? null : suffixIcon,
      suffix: suffixText != null ? _buildSuffixText() : null,
      enabledBorder: _outlineInputBorder(),
      focusedBorder: _focusedInputBorder(),
      errorBorder: _errorInputBorder(),
      focusedErrorBorder: _errorInputBorder(),
      errorText: errorText,
      errorStyle: AppFonts.blackBoldTextStyle.copyWith(
        fontSize: 12,
        color: Colors.red,
        height: 2,
      ),
      errorMaxLines: 2,
    );
  }

  OutlineInputBorder _outlineInputBorder() => OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        borderSide: BorderSide(color: borderColor),
      );

  OutlineInputBorder _focusedInputBorder() => OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        borderSide: BorderSide(color: focussedBorderColor),
      );

  OutlineInputBorder _errorInputBorder() => OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        borderSide: const BorderSide(color: AppColors.error),
      );

  Widget _buildLabel() => Padding(
        padding: const EdgeInsets.only(bottom: AppDimens.paddingSmall / 2),
        child: RichText(
          text: TextSpan(
              style: labelStyle ?? AppFonts.blackRegularTextStyle,
              children: [
                TextSpan(text: label!),
                if (isRequired)
                  TextSpan(
                    text: "*",
                    style: AppFonts.blackLightTextStyle.copyWith(
                      color: AppColors.semanticError500,
                    ),
                  ),
              ]),
        ),
      );

  Widget? _buildPrefixIcon() {
    if (prefixIcon == null) {
      return null;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.paddingSmall / 2,
      ),
      child: prefixIcon,
    );
  }

  Widget _buildSuffixText() => Container(
        margin: const EdgeInsets.only(right: AppDimens.paddingSmall / 2),
        child: Text(suffixText!, style: AppFonts.blackRegularTextStyle),
      );
}

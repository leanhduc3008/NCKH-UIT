import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common/constants/dimens.dart';
import '../../common/constants/theme.dart';
import '../../common/extension/context_extension.dart';
import 'border_input_decoration.dart';

/// If you making a `AppTextFormField` where you require save, reset, or validate
class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    // Form
    this.fieldKey,
    this.restorationId,
    this.initialValue,
    this.validator,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.onSaved,
    this.onFieldSubmitted,
    // Text field
    this.controller,
    this.focusNode,
    this.decoration,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.sentences,
    this.style,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    this.readOnly = false,
    this.showCursor = true,
    this.autofocus = false,
    this.autocorrect = true,
    this.obscureText = false,
    this.enableSuggestions = true,
    this.enabled,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength = 200,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.onEditingComplete,
    this.onTap,
    this.inputFormatters,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final TextStyle? style;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;
  final bool readOnly;
  final bool autofocus;
  final bool autocorrect;
  final bool obscureText;
  final bool enableSuggestions;
  final bool expands;
  final bool? enabled;
  final bool showCursor;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final String? restorationId;
  final GestureTapCallback? onTap;
  final List<TextInputFormatter>? inputFormatters;
  // Form
  final GlobalKey<FormFieldState<String>>? fieldKey;
  final String? initialValue;
  final AutovalidateMode autovalidateMode;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      showCursor: showCursor,
      obscuringCharacter: '*',
      cursorColor: AppColors.black,
      style: style ?? context.textStyle.bodyMedium,
      decoration: decoration ??
          BorderInputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle: style ?? context.textStyle.bodyMedium,
            labelStyle: style ?? context.textStyle.bodyMedium,
            contentPadding: const EdgeInsets.all(Dimens.s2),
          ),
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      textDirection: textDirection,
      readOnly: readOnly,
      autofocus: autofocus,
      autocorrect: autocorrect,
      obscureText: obscureText,
      enableSuggestions: enableSuggestions,
      enabled: enabled,
      maxLines: maxLines,
      minLines: minLines,
      expands: expands,
      maxLength: maxLength,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      onTap: onTap,
      inputFormatters: inputFormatters,
      // Form
      initialValue: initialValue,
      onSaved: onSaved,
      validator: validator,
      restorationId: restorationId,
      autovalidateMode: autovalidateMode,
    );
  }
}

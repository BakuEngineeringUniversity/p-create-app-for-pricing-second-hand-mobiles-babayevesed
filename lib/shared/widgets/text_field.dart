import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String? title;
  final String? hint;
  final bool? autoFocus;
  final String? initString;
  final Function(String)? onChanged;
  final Widget? prefix;
  final Widget? suffix;
  final List<TextInputFormatter>? formatters;
  final bool? enabled;
  final Color? textColor;
  final Color? borderColor;
  final FocusNode? focusNode;
  final TextInputType keyBoardType;
  final TextInputAction? textInputAction;
  final String? Function(String? v)? validator;
  final TextEditingController? controller;
  final bool? hasBorder;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final VoidCallback? onTap;
  final bool obsecureText;
  final int? maxLines;
  final int? maxLength;
  final Color? fillColor;
  const CustomTextField(
      {Key? key,
      this.title,
      this.hasBorder = true,
      this.focusNode,
      this.hint,
      this.style,
      this.autoFocus,
      this.initString,
      required this.onChanged,
      this.formatters,
      this.enabled,
      this.prefix,
      this.textColor,
      this.keyBoardType = TextInputType.text,
      this.textInputAction = TextInputAction.done,
      this.validator,
      this.controller,
      this.hintStyle,
      this.borderColor,
      this.onTap,
      this.suffix,
      this.maxLines,
      this.maxLength,
      this.fillColor,
      this.obsecureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      textInputAction: textInputAction,
      initialValue: initString,
      obscureText: obsecureText,
      style: style ??
          Theme.of(context).textTheme.bodyText1!.copyWith(color: textColor ?? Colors.black),
      enabled: enabled ?? true,
      controller: controller,
      autofocus: autoFocus ?? false,
      onChanged: onChanged,
      inputFormatters: formatters ?? [],
      keyboardType: keyBoardType,
      validator: validator,
      onTap: onTap,
      maxLength: maxLength,
      maxLines: maxLines,
      decoration: InputDecoration(
        prefixIcon: prefix,
        suffixIcon: suffix,
        labelText: title,
        filled: true,
        hintText: hint ?? '',
        floatingLabelStyle: style?.copyWith(
              color: Colors.purple,
            ) ??
            Theme.of(context).textTheme.caption!.copyWith(
                  color: Colors.purple,
                  fontSize: 16,
                ),
        labelStyle: style?.copyWith(
              color: Colors.purple,
            ) ??
            Theme.of(context).textTheme.caption!.copyWith(
                  color: Colors.grey,
                  fontSize: 16,
                ),
        hintStyle: hintStyle ??
            Theme.of(context).textTheme.caption!.copyWith(
                  color: Colors.grey,
                  fontSize: 1,
                ),
        fillColor: fillColor ?? Colors.white,
        contentPadding: const EdgeInsets.all(20),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.grey.shade200,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: !hasBorder!
              ? BorderSide.none
              : BorderSide(
                  color: borderColor ?? Colors.grey.shade200,
                  width: 2,
                ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: !hasBorder!
              ? BorderSide.none
              : const BorderSide(
                  color: Colors.blueAccent,
                  width: 2,
                ),
        ),
      ),
    );
  }
}

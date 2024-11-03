import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomInput extends StatelessWidget {
  const CustomInput(
      {super.key,
      this.labelText,
      this.alignment,
      this.width,
      this.scrollPadding,
      this.labelStyle,
      this.controller,
      this.focusNode,
      this.autofocus = false,
      this.textStyle,
      this.obscureText = false,
      this.textInputAction = TextInputAction.next,
      this.textInputType = TextInputType.text,
      this.maxLines,
      this.hintText,
      this.hintStyle,
      this.prefix,
      this.prefixConstraints,
      this.suffix,
      this.suffixConstraints,
      this.contentPadding,
      this.borderDecoration,
      this.fillColor,
      this.filled = true,
      this.validator,
      this.ontap,
      this.onchanged,
      this.inputFormatters,
      this.padding,
      this.readonly = false});

  final Alignment? alignment;

  final List<TextInputFormatter>? inputFormatters;

  final String? labelText;

  final double? width;

  final TextEditingController? scrollPadding;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final bool? autofocus;

  final TextStyle? textStyle;

  final bool? obscureText;

  final TextInputAction? textInputAction;

  final TextInputType? textInputType;

  final int? maxLines;

  final String? hintText;

  final TextStyle? hintStyle;

  final TextStyle? labelStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final EdgeInsets? contentPadding;

  final InputBorder? borderDecoration;

  final Color? fillColor;

  final bool? filled;

  final bool readonly;

  final EdgeInsets? padding;

  final FormFieldValidator<String>? validator;

  final Function()? ontap;

  final Function(String)? onchanged;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: textFormFieldWidget,
          )
        : textFormFieldWidget;
  }

  Widget get textFormFieldWidget => SizedBox(
        width: width ?? double.maxFinite,
        child: Padding(
          padding:
              padding ?? EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
          child: TextFormField(
            textDirection: TextDirection.rtl,
            onChanged: onchanged,
            scrollPadding: EdgeInsets.only(
                bottom: MediaQuery.of(Get.context!).viewInsets.bottom),
            controller: controller,
            focusNode: focusNode,
            autofocus: autofocus!,
            style: textStyle ??
                const TextStyle(
                    // fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 16),
            onTap: ontap,
            obscureText: obscureText!,
            textInputAction: textInputAction,
            keyboardType: textInputType,
            minLines: 1,
            maxLines: maxLines ?? 1,
            decoration: decoration,
            validator: validator,
            readOnly: readonly,
            inputFormatters: inputFormatters ??
                (textInputType == TextInputType.number
                    ? [
                        FilteringTextInputFormatter.digitsOnly,
                      ]
                    : null),
          ),
        ),
      );
  InputDecoration get decoration => InputDecoration(
        errorStyle: const TextStyle(color: Colors.red),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: labelText,
        labelStyle: labelStyle ??
            Get.textTheme.displaySmall!.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
        hintText: hintText ?? "",
        hintStyle: hintStyle ??
            Get.textTheme.displaySmall!.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                color: const Color.fromRGBO(189, 189, 189, 1)),
        prefixIcon: prefix,
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        isDense: true,
        contentPadding: contentPadding ??
            ((suffix == null)
                ? EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h)
                : EdgeInsets.only(
                    left: 8.w,
                    right: 8.w,
                    top: 25.h,
                    bottom: 25.h,
                  )),
        fillColor: fillColor ?? Colors.white,
        filled: filled,
        border: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(13.r),
              borderSide: const BorderSide(
                  color: Color.fromRGBO(247, 247, 249, 1), width: 1),
            ),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(13.r),
              borderSide: const BorderSide(
                  color: Color.fromRGBO(247, 247, 249, 1), width: 1),
            ),
        focusedBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(13.r),
              borderSide: const BorderSide(
                  color: Color.fromRGBO(247, 247, 249, 1), width: 1),
            ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.red.withOpacity(0.5), width: 1),
        ),
      );
}

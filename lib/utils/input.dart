import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kooha_movie_app/utils/pallet.dart';
import '../utils/font_manager.dart';
import '../utils/style_manager.dart';
import '../utils/value_manager.dart';

class InputField extends StatelessWidget {
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autovalidateMode;
  final TextAlign? textAlign;
  final TextInputType? keyBoardType;
  final String? Function(String? val)? validationCallback;
  final String? Function(String? val)? onSaved;
  final void Function()? onEdittingComplete;
  final String? formError;
  final String label;
  final String topLabel;
  final String? hintText;
  final FocusNode? focusnode;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final String? message;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final Function()? clearForm;
  final Function()? onTap;
  final Function(String)? onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLength;
  final int? maxLines;
  final double? height;
  final bool? enabled;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final Color? fillColor;
  final Color? hintColor;
  final bool? showCursor;
  final bool readOnly;
  final Widget? labelRightItem;
  final Widget? topLabelRightItem;
  final TextStyle? labelStyle;
  final TextStyle? topLabelStyle;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextStyle? style;

  const InputField({
    Key? key,
    this.autovalidateMode,
    this.style,
    this.inputFormatters,
    this.textAlign,
    this.keyBoardType,
    this.onEdittingComplete,
    this.validationCallback,
    this.onSaved,
    this.message,
    this.hintText,
    this.label = '',
    this.topLabel = '',
    this.formError,
    this.focusnode,
    this.textInputAction,
    this.controller,
    this.clearForm,
    this.height,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.onChanged,
    this.contentPadding,
    this.onTap,
    this.maxLength,
    this.maxLines = 1,
    this.enabled = true,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.fillColor,
    this.validator,
    this.hintColor,
    this.showCursor,
    this.readOnly = false,
    this.labelRightItem,
    this.topLabelRightItem,
    this.labelStyle,
    this.topLabelStyle,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fontSize = style?.fontSize == null
        ? 16 / MediaQuery.textScaleFactorOf(context)
        : style!.fontSize! / MediaQuery.textScaleFactorOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (topLabel != "")
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    textScaleFactor: 1.0,
                    topLabel,
                    style: topLabelStyle ??
                        getRegularStyle(
                          fontSize: FontSize.s14,
                          color: AppColor.white
                        ),
                  ),
                  if (topLabelRightItem != null) labelRightItem!
                ],
              ),
              const SizedBox(
                height: AppSize.s8,
              ),
            ],
          ),
        TextFormField(
          style: getLightStyle(
            fontSize: FontSize.s14,
            color: AppColor.white,
          ).copyWith(fontSize: fontSize),
          initialValue: initialValue,
          showCursor: showCursor,
          cursorColor: AppColor.white,
          readOnly: readOnly,
          validator: validator,
          maxLength: maxLength,
          enabled: enabled,
          onTap: onTap,
          maxLines: maxLines,
          autovalidateMode: autovalidateMode,
          focusNode: focusnode,
          onSaved: onSaved,
          controller: controller,
          textInputAction: textInputAction ?? TextInputAction.next,
          decoration: InputDecoration(
            counterText: '',
            hintStyle: getLightStyle(
              fontSize: FontSize.s14,
              color: AppColor.grey1,
            ).copyWith(fontSize: fontSize),
            border: border,
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: AppColor.grey1,
                width: 0,
              ),
            ),
            labelText: label == '' ? null : label,
            isDense: true,
            hintText: hintText,
            errorText: formError,
            contentPadding: contentPadding ?? EdgeInsets.symmetric(
                vertical: height == null ? AppPadding.p18 : height!,
                horizontal: AppPadding.p14),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            fillColor: AppColor.black,
            filled: true,
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color:  AppColor.yellow,
                width: 1,
              ),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color:  AppColor.yellow,
                width: 1,
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: AppColor.errorColor,
                width: 1.5,
              ),
            ),
          ),
          textAlign: textAlign ?? TextAlign.start,
          inputFormatters: inputFormatters,
          keyboardType: keyBoardType,
          onChanged: onChanged,
          textCapitalization: TextCapitalization.sentences,
          onEditingComplete: onEdittingComplete,
          obscureText: obscureText ?? false,
        ),
      ],
    );
  }
}

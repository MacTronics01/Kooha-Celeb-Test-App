import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/pallet.dart';

enum ButtonType { fill, outline, text }

class AppButton extends StatelessWidget {
  final double borderRadius;
  final double fontSize;
  final String title;
  final bool busy;
  final Border? border;
  final Function onPressed;
  final Color buttonBgColor;
  final Color? loadingColor;
  final Color? buttonTextColor;
  final Color? leadingIconColor;
  final Color? trailingIconColor;
  final bool? disabled;
  // final FontWeight fontWeight;
  final ButtonType? buttonType;
  final String? leadingIcon;
  final String? trailingIcon;
  final double trailingIconSpace;
  final EdgeInsets? padding;
  final bool? loading;
  const AppButton({
    Key? key,
    this.borderRadius = 16.0,
    this.border,
    this.fontSize = 14.0,
    this.trailingIconSpace = 4.0,
    required this.onPressed,
    this.buttonBgColor = AppColor.green,
    this.buttonTextColor = AppColor.white,
    required this.title,
    this.leadingIcon,
    this.trailingIcon,
    this.leadingIconColor = AppColor.white,
    this.trailingIconColor = AppColor.white,
    this.busy = false,
    this.loadingColor,
    this.disabled,
    this.padding,
    this.loading,
    this.buttonType = ButtonType.fill,
  }) : super(key: key);

  Color getBackgroundColor() {
    if (buttonType == ButtonType.outline) {
      return Colors.transparent;
    } else if (buttonType == ButtonType.fill) {
      return buttonBgColor;
    } else {
      return Colors.transparent;
    }
  }

  Color getColor() {
    if (buttonType == ButtonType.fill) {
      return buttonTextColor != null ? buttonTextColor! : AppColor.white;
    } else if (buttonType == ButtonType.outline) {
      return buttonTextColor!;
    } else {
      return buttonTextColor != null ? buttonTextColor! : buttonBgColor;
    }
  }

  Border constructBorder() {
    if (border != null) {
      return border!;
    }
    if (buttonType == ButtonType.outline) {
      return Border.all(
        color: getColor(),
        width: 2.w,
      );
    } else {
      return Border.all(
        color: Colors.transparent,
        width: 0.w,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final _color = getColor();
    final _bgColor = getBackgroundColor();
    return InkWell(
      splashColor:AppColor.primaryColor,
      // onTap: onPressed,
      onTap: ((disabled != null && disabled!) || loading != null && loading!)
          ? null
          : () => onPressed(),
      child: Container(
        height: 55.h,
        padding: padding ??
            EdgeInsets.symmetric(
              vertical: 13.0.h,
            ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.r),
          color:
              (disabled != null && disabled!) || (loading != null && loading!)
                  ? _bgColor.withOpacity(0.6)
                  : _bgColor,
          border: constructBorder(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (leadingIcon != null)
              Container(
                margin: EdgeInsets.only(right: 10.w),
                child: Image.asset(
                  leadingIcon!,
                  height: 20.h,
                  width: 20.w,
                ),
              ),
            loading != null && loading!
                ? const Text('')
                : Text(title,
              textScaleFactor: 1.0,
              style: TextStyle(
                fontSize:  16,
                fontFamily: 'Poppins',
                color: _color,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (trailingIcon != null) SizedBox(width: trailingIconSpace),
            if (trailingIcon != null)
              Image.asset(
                trailingIcon!,
                height: 20.h,
                width: 20.w,
              ),
            if (loading != null && loading!)
              SizedBox(
                width: 16.w,
                height: 16.h,
                child: CircularProgressIndicator(
                  color: loadingColor ?? _color,
                  strokeWidth: 3,
                ),
              )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kooha_movie_app/utils/pallet.dart';
import 'package:kooha_movie_app/utils/widget_extensions.dart';
import 'package:oktoast/oktoast.dart';
import 'app_images.dart';

Widget toast(String message, {bool? success}) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Align(
      alignment: Alignment.topCenter,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0.r),
        child: Container(
          margin: EdgeInsets.only(top: 50.h),
          padding: EdgeInsets.all(12.0.h),
          color: !success! ? AppColor.red : AppColor.green,
          child: Row(
            children: [
              !success
                  ? Image.asset(AppImages.warning, width: 25, height: 25)
                  : Image.asset(
                      AppImages.check,
                      width: 25,
                      height: 25,
                    ),
              10.0.sbW,
              Expanded(
                child: Text(
                  message,
                  style: TextStyle(
                    color: !success ? AppColor.white : AppColor.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

showCustomToast(String message, {bool success = false, num? time}) {
  // dialogLocation(message: message, success: success, time: time);
  showToastWidget(
    toast(message, success: success),
    duration: const Duration(seconds: 3),
    onDismiss: () {},
  );
}

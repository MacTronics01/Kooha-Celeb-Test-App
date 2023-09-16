import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/pallet.dart';

class BackButtons extends StatelessWidget {
  BackButtons({super.key, required this.onTap});
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.r),
              border: Border.all(color:AppColor.grey.withOpacity(0.7),)
          ),
          child:Container(
            margin: EdgeInsets.all(10.w),
            alignment: Alignment.center,
            child: const Icon(Icons.arrow_back,
              color: AppColor.grey1,
              size: 18,
            ),
          )
        ),
    );
  }
}

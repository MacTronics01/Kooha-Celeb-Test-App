import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

EdgeInsets pad({
  double both = 0,
  double? horiz,
  double? vert,
}) =>
    EdgeInsets.symmetric(
      horizontal: (horiz ?? both).w,
      vertical: (vert ?? both).h,
    );

EdgeInsets padOnly({
  double? top,
  double? left,
  double? right,
  double? down,
}) {
  if (top != null) return EdgeInsets.only(top: top.h);
  if (left != null) return EdgeInsets.only(left: left.w);
  if (right != null) return EdgeInsets.only(right: right.w);
  if (down != null) return EdgeInsets.only(bottom: down.h);
  return const EdgeInsets.only(top: 0);
}

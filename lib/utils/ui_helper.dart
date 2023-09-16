import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:kooha_movie_app/utils/pallet.dart';

 Widget horizontalSpaceTiny = Gap(5.w);
 Widget horizontalSpaceSmall = Gap(10.w);
 Widget horizontalSpaceMedium = Gap(25.w);

 Widget gapTiny = Gap(5.h);
 Widget gapSmall = Gap(10.h);
 Widget gapMedium = Gap(25.h);
 Widget gapLarge = Gap(50.h);
 Widget gapMassive = Gap(120.h);



Widget spaceDivider =   Divider(
  color: AppColor.grey.withOpacity(0.1),
  thickness: 1, );
// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:kooha_movie_app/utils/pallet.dart';
import 'package:kooha_movie_app/utils/ui_helper.dart';
import 'package:kooha_movie_app/utils/ui_helper1.dart';

class PrimaryBtn extends StatelessWidget {
  PrimaryBtn({
    Key? key,
    this.color,
    this.textColor,
    this.isImage,
    this.width,
    this.height,
    this.iconColor,
    this.bordercolor,
    this.image,
    required this.title,
    required this.onPress,
  }) : super(key: key);

  Color? color;
  Color? bordercolor;
  Color? iconColor;
  bool? isImage;
  double? height;
  double? width;
  String? image;
  Color? textColor;
  final String title;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: SizedBox(
        child: Container(
          height: height ?? 60,
          width: width ?? screenWidth(context, 1.1),
          decoration: BoxDecoration(
            color: color ?? AppColor.primaryColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                width: 2, color: bordercolor ?? AppColor.primaryColor),
          ),
          child: isImage == true
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Image.asset(
                          image ?? '',
                          height: 30,
                          width: 50,
                        ),
                      ),
                      gapMedium,
                      Center(
                        child: Text(
                          textScaleFactor: 1.0,
                          title,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Outfit',
                            color: textColor ?? AppColor.lightColor,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Center(
                  child: Text(
                    textScaleFactor: 1.0,
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Outfit',
                      color: textColor ?? AppColor.lightColor,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

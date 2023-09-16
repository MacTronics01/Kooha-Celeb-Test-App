import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kooha_movie_app/utils/app_images.dart';
import 'package:kooha_movie_app/utils/app_strings.dart';
import 'package:kooha_movie_app/utils/constants.dart';
import 'package:kooha_movie_app/utils/snack_message.dart';
import 'package:video_player/video_player.dart';
import '../../../utils/back_button.dart';
import '../../../utils/pallet.dart';
import '../../../utils/widget_extensions.dart';
import '../../data/core/network_config.dart';
import '../../domain/domain/celeb_response.dart';
import '../../utils/button.dart';
import '../../utils/style_manager.dart';
import '../base/base_ui.dart';
import 'home.vm.dart';

class ViewDetailsScreen extends StatelessWidget {
  ViewDetailsScreen({
    Key? key,
    required this. image,
    required this. name,
    required this. occupation,
    required this. bio,
    required this. book,
    required this. videos,
  }) : super(key: key);
   String image;
   String name;
   String occupation;
   String bio;
   String book;
  List<Videos>? videos;

  late VideoPlayerController _controller;

  // @override
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
        onModelReady: (model) async {
          videos?.forEach((video) {
            final videoPath = "${NetworkConfig.IMAGE_URL}${video.videoPath}";
            print(videoPath);
            _controller = VideoPlayerController.network(videoPath)
              ..initialize().then((_) {
                // Ensure the first frame is shown
                model.notifyListeners();
              });
          });
        },
        builder: (context, model, child) => Scaffold(
            backgroundColor: AppColor.background,
            body: Container(
              width: width(context),
              height: height(context),
              margin: EdgeInsets.only(right: 24.w, left: 24.w),
              child: Column(children: [
                60.0.sbH,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BackButtons(onTap: () {
                      navigationService.goBack();
                    }),
                    const Spacer()
                  ],
                ),
                24.0.sbH,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.r),
                            border: Border.all(width: 1.w,color: AppColor.yellow)
                          ),
                          child: ClipOval(
                            child: Image.network(
                              image,
                              width: 100.0,
                              height: 100.0,
                              fit: BoxFit.cover,
                            ),
                          )
                        ),
                        12.0.sbW,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                textScaleFactor: 1.0,
                                name,
                                style: getBoldStyle(
                                    fontSize: 14, color: AppColor.white)
                            ),
                            5.0.sbH,
                            Text(
                                textScaleFactor: 1.0,
                                occupation,
                                style: getMediumStyle(
                                    fontSize: 14, color: AppColor.grey1)
                            ),
                          ],
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: (){
                        if(model.isFollow==false){
                          model.isFollow=true;
                          model.notifyListeners();
                        }else{
                          model.isFollow=false;
                          model.notifyListeners();
                        }
                      },
                      child: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          color: AppColor.grey,
                          borderRadius: BorderRadius.circular(30.r)
                        ),
                        child: Center(
                          child: Text(
                              textScaleFactor: 1.0,
                              model.isFollow==false?
                                  AppStrings.follow:AppStrings.following,
                              style: getSemiBoldStyle(
                                  fontSize: 12, color: model.isFollow==false? AppColor.yellow:AppColor.green)
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                15.0.sbH,
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    textAlign:TextAlign.start,
                      bio,
                      style: getLightStyle(
                        color: AppColor.white,
                        fontSize: 14
                      )
                  ),
                ),
                24.0.sbH,
                SizedBox(
                  height: 260,
                  child: ListView.builder(
                    itemCount: videos?.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return videos == null || videos!.isEmpty
                          ? Center(
                        child: Text(
                          AppStrings.noVideos,
                          textScaleFactor: 1.0,
                          style: getSemiBoldStyle(
                            fontSize: 12,
                            color: AppColor.yellow,
                          ),
                        ),
                      )
                          : Container(
                        margin: EdgeInsets.only(left: 10.h),
                        color: AppColor.grey,
                        width: 170.w,
                        height: 197.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.r),
                          child: _controller.value.isInitialized
                              ? AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          )
                              : const Center(child: CircularProgressIndicator(
                            color: AppColor.orange,
                          )), // Show a loading indicator while initializing
                        ),
                      );
                    },
                  ),
                ),
                // SizedBox(
                //   height: 260,
                //   child: Expanded(
                //     child:
                //     ListView.builder(
                //       itemCount: videos?.length, // Number of items in the list
                //       scrollDirection: Axis.horizontal, // Vertical scrolling
                //       itemBuilder: (BuildContext context, int index) {
                //         return videos==[]?
                //         Center(
                //           child: Text(
                //               textScaleFactor: 1.0,
                //               AppStrings.noVideos,
                //               style: getSemiBoldStyle(
                //                   fontSize: 12, color: AppColor.yellow)
                //           ),
                //         ):Container(
                //           margin: EdgeInsets.only(left: 10.h),
                //           width: 170.w,
                //           height: 197.h,
                //           child: ClipRRect(
                //             borderRadius: BorderRadius.circular(15.r),
                //             child: Image.network(
                //               image,
                //               width: double.infinity, // Use double.infinity to fill the width of the container
                //               height: double.infinity, // Use double.infinity to fill the height of the container
                //               fit: BoxFit.cover, // Adjust the BoxFit as needed
                //             ),
                //           ),
                //         );
                //       },
                //     ),
                //   ),
                // ),
                24.0.sbH,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        textScaleFactor: 1.0,
                        AppStrings.reviews,
                        style: getSemiBoldStyle(
                            fontSize: 14, color: AppColor.grey1)
                    ),
                    Text(
                        textScaleFactor: 1.0,
                        AppStrings.seeAll,
                        style: getMediumStyle(
                            fontSize: 12, color: AppColor.yellow)
                    ),
                  ],
                ),
                100.0.sbH,
                Center(
                  child:
                  Text(
                      textScaleFactor: 1.0,
                      AppStrings.noReviews,
                      style: getSemiBoldStyle(
                          fontSize: 18, color: AppColor.yellow)
                  ),
                )
              ]),
            ),
          bottomSheet: Container(
            height: 120,
            padding: EdgeInsets.only(left: 24.w,right: 24.w),
            color: AppColor.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 100,
                  child: AppButton(
                    leadingIcon: AppImages.msg,
                    buttonBgColor: AppColor.grey,
                    buttonTextColor: AppColor.yellow,
                    onPressed: () {
                      showCustomToast("Not available",success: false);
                    },
                    title:  AppStrings.chat,
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: AppButton(
                    buttonBgColor: AppColor.orange,
                    buttonTextColor: AppColor.white,
                    onPressed: () {
                      showCustomToast("Not available",success: false);
                    },
                    title:  "${AppStrings.book}$book",
                  ),
                ),
              ],
            ),
          )
        )
    );
  }
}

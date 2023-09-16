import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kooha_movie_app/presentation/home/view_details.dart';
import 'package:kooha_movie_app/utils/app_images.dart';
import 'package:kooha_movie_app/utils/style_manager.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/input.dart';
import '../../../utils/pallet.dart';
import '../../../utils/widget_extensions.dart';
import '../../data/core/network_config.dart';
import '../../domain/domain/celeb_response.dart';
import '../../utils/shimmer_loader.ui.dart';
import '../base/base_ui.dart';
import 'home.vm.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
        onModelReady: (model) async {
          // model.getCeleb( model.page,  model.limit,  model.q);
        },
        builder: (context, model, child) => Scaffold(
          backgroundColor: AppColor.background,
          body: Container(
              width: width(context),
              height: height(context),
              margin: EdgeInsets.only(right: 24.w, left: 24.w),
              child: Column(
                children:[
                60.0.sbH,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        textScaleFactor: 1.0,
                        AppStrings.browse,
                        style: getSemiBoldStyle(
                            fontSize: 24, color: AppColor.white)
                    ),
                    Image.asset(AppImages.noti,width: 22.w,height:22.h)
                  ],
                ),
                40.0.sbH,
                InputField(
                  hintText: AppStrings.search,
                  controller: model.search,
                  onChanged: (v){
                    model.limit=v;
                    model.getCelebs(model.page, v,v);
                    model.notifyListeners();
                  },
                  prefixIcon: const Icon(Icons.search,size: 26,color: AppColor.grey1,),
                ),
                20.0.sbH,
                  Expanded(
                    child:
                    StreamBuilder<CelebResponse?>(
                        stream: model.getCelebs(model.page, model.limit,model.search.text),
                        builder: (context, snapshot) {
                          CelebResponse? request = snapshot.data;
                          List<Records>? celeb = request?.data?.records;
                          if (snapshot.data != null) {
                            return snapshot.data?.data == null
                                ? Center(
                              child: Text(textScaleFactor: 1.0,
                                "No Data to display",
                                style:
                                getMediumStyle(fontSize: 16),
                              ),
                            ):
                            GridView.builder(
                              padding: const EdgeInsets.symmetric(horizontal: 0),
                              itemCount: celeb?.length,
                              gridDelegate:   SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 10.w,
                                crossAxisCount: 2,
                                mainAxisSpacing: 10.h,
                                childAspectRatio: (2 / 3.3.h),
                              ),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ViewDetailsScreen(
                                          image:"${NetworkConfig.IMAGE_URL}${celeb[index].profileImagePath.toString()}",
                                          name:celeb[index].fullName.toString(),
                                          occupation:celeb[index].occupation.toString()=="null"?"N/A":celeb[index].occupation.toString(),
                                          bio:celeb[index].bio.toString()=="null"?"N/A":celeb[index].bio.toString(),
                                          videos:celeb[index].influencer?.videos,
                                          book: celeb[index].fee!.bookingFee.toString(),

                                      )),
                                    );
                                  },
                                  child: SizedBox(
                                    width: 100,
                                    height: 240,
                                    child: Column(
                                      children: [
                                        Container(
                                          width: width(context),
                                          height: 197,
                                          decoration: BoxDecoration(
                                            color: AppColor.grey1,
                                            borderRadius: BorderRadius.circular(15.r),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(15.r), // Set the same radius as the Container
                                            child: Image.network(
                                              "${NetworkConfig.IMAGE_URL}${celeb![index].profileImagePath.toString()}",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        5.0.sbH,
                                        Container(
                                          alignment:Alignment.centerLeft,
                                          child: Text(
                                              textScaleFactor: 1.0,
                                              celeb[index].fullName.toString(),
                                              style: getLightStyle(
                                                  fontSize: 14, color: AppColor.white)
                                          ),
                                        ),
                                        2.0.sbH,
                                        Container(
                                          alignment:Alignment.centerLeft,
                                          child: Text(
                                              textScaleFactor: 1.0,
                                              celeb[index].occupation.toString()=="null"?"N/A":celeb[index].occupation.toString(),
                                              style: getLightStyle(
                                                  fontSize: 14, color: AppColor.grey1)
                                          ),
                                        ),
                                        2.0.sbH,
                                        Container(
                                          alignment:Alignment.centerLeft,
                                          child: Text(
                                              textScaleFactor: 1.0,
                                              "#${celeb[index].fee!.bookingFee.toString()}",
                                              style: getSemiBoldStyle(
                                                  fontSize: 14, color: AppColor.yellow)
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          } else {
                            return const ShimmerCard();
                          }})






                  )
                ],
              )),
        ));
  }
}

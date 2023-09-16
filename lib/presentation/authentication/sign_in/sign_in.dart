import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kooha_movie_app/presentation/authentication/sign_in/sign_in.vm.dart';
import 'package:kooha_movie_app/utils/snack_message.dart';
import 'package:kooha_movie_app/utils/style_manager.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/back_button.dart';
import '../../../utils/button.dart';
import '../../../utils/input.dart';
import '../../../utils/pallet.dart';
import '../../../utils/widget_extensions.dart';
import '../../base/base_ui.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SignInViewModel>(
        onModelReady: (model) async {},
        builder: (context, model, child) => Scaffold(
              backgroundColor: AppColor.background,
              body: Form(
                key: model.formKey,
                child: SingleChildScrollView(
                  child: Container(
                      width: width(context),
                      height: height(context),
                      margin: EdgeInsets.only(right: 24.w, left: 24.w),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              60.0.sbH,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  BackButtons(onTap: () {
                                    showCustomToast('No screen', success: false);
                                  }),
                                  GestureDetector(
                                    onTap: (){
                                      showCustomToast('No screen', success: false);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          top: 10.h,
                                          bottom: 10.h,
                                          right: 20.w,
                                          left: 20.w),
                                      decoration: BoxDecoration(
                                          color: AppColor.grey,
                                          borderRadius:
                                              BorderRadius.circular(20.r)),
                                      child: Text(
                                        textScaleFactor: 1.0,
                                        AppStrings.create,
                                        style: getRegularStyle(
                                            color: AppColor.yellow, fontSize: 14),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              33.0.sbH,
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    textScaleFactor: 1.0,
                                    AppStrings.welcome,
                                    style: getSemiBoldStyle(
                                        fontSize: 22, color: AppColor.white)),
                              ),
                              2.0.sbH,
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    textScaleFactor: 1.0,
                                    AppStrings.beReady,
                                    style: getLightStyle(
                                        fontSize: 14, color: AppColor.grey1)),
                              ),
                              40.0.sbH,
                              InputField(
                                hintText: AppStrings.emails,
                                topLabel: AppStrings.email,
                                controller: model.email,
                                suffixIcon: model.isWrongEmail == "true"
                                    ? const Icon(
                                        Icons.cancel,
                                        color: AppColor.red,
                                      )
                                    : model.isWrongEmail == "false"?
                                const Icon(
                                        Icons.check_circle,
                                        color: AppColor.yellow,
                                      ):Container(width: 2),
                                onChanged: (v) {
                                  String validate =
                                      v.replaceAll(RegExp(r"\s+"), "");
                                  if (!RegExp(model.emailReg)
                                      .hasMatch(validate)) {
                                    model.isWrongEmail = "true";
                                    model.notifyListeners();
                                  } else {
                                    model.isWrongEmail = "false";
                                    model.notifyListeners();
                                  }
                                },
                                validator: (val) {
                                  String validate =
                                      val!.replaceAll(RegExp(r"\s+"), "");
                                  if (validate.isEmpty ||
                                      !RegExp(model.emailReg)
                                          .hasMatch(validate)) {
                                    return AppStrings.invalidEMail;
                                  }
                                  return null;
                                },
                                autovalidateMode: model.autovalidateMode,
                              ),
                              20.0.sbH,
                              InputField(
                                hintText: AppStrings.passwords,
                                topLabel: AppStrings.password,
                                controller: model.password,
                                obscureText:model.isHide,
                                suffixIcon: GestureDetector(
                                  onTap: (){
                                    if(model.isHide==true){
                                      model.isHide=false;
                                      model.notifyListeners();
                                    }else{
                                      model.isHide=true;
                                      model.notifyListeners();
                                    }
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top: 15.h),
                                    child: Text(model.isHide==true?"Show":"Hide",
                                    style: getBoldStyle(color: AppColor.yellow,
                                    fontSize: 14),),
                                  ),
                                ),
                                validator: (val) {
                                  if (val!.length < 8) {
                                    return AppStrings.passwords;
                                  }
                                  return null;
                                },
                                autovalidateMode: model.autovalidateMode,
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            margin: EdgeInsets.only(bottom: 48.h),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    showCustomToast('No screen', success: false);
                                  },
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                            text: AppStrings.forgot,
                                            style: getLightStyle(
                                                fontSize: 14,
                                                color: AppColor.grey1)),
                                        TextSpan(
                                            text: AppStrings.reset,
                                            style: getSemiBoldStyle(
                                                fontSize: 14,
                                                color: AppColor.yellow)),
                                      ],
                                    ),
                                  ),
                                ),
                                32.0.sbH,
                                AppButton(
                                  buttonBgColor: AppColor.orange,
                                  buttonTextColor: AppColor.white,
                                  onPressed: () {
                                    FocusManager.instance.primaryFocus?.unfocus();
                                    if (model.formKey.currentState!.validate()) {
                                      model.checkLogin();
                                    } else {
                                      model.setValidateMode(
                                          AutovalidateMode.onUserInteraction);
                                    }
                                  },
                                  title: AppStrings.login,
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                ),
              ),
            ));
  }
}

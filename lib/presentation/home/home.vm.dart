import 'package:flutter/cupertino.dart';
import '../../../utils/snack_message.dart';
import '../../domain/domain/celeb_response.dart';
import '../base/base.vm.dart';

class HomeViewModel extends BaseViewModel {

  final TextEditingController search = TextEditingController();


  String isWrongEmail = "";
  String page = "1";
  String limit = "";
  String q = "";
  bool isHide = true;
  bool isFollow = false;



  Stream<CelebResponse?>getCelebs(String page, String limit, String q) async* {
    while (true) {
      CelebResponse? getBlogResponse =
      await userRepository.getCeleb(page, limit, q);
      yield getBlogResponse;
    }
  }


  // sending parameters to the repository and then receiving response on success
  Future<CelebResponse?>getCeleb(String page, String limit, String q) async {
    // loading start
    startLoader();
    try {
      var response = await userRepository.getCeleb(page, limit, q);
      // loading start
      stopLoader();
      showCustomToast("Logged in successfully", success: true);
      // on success navigate to dashboard
      // navigationService.navigateToReplace(AppRoutes.bottomNav);
      return response;
    } catch (error) {
      stopLoader();
    }
  }
}

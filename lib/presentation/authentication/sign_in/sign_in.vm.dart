import 'package:flutter/cupertino.dart';
import '../../../domain/domain/login_response.dart';
import '../../../routes/routes.dart';
import '../../../utils/snack_message.dart';
import '../../base/base.vm.dart';

class SignInViewModel extends BaseViewModel {
  final emailReg =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  final formKey = GlobalKey<FormState>();

  AutovalidateMode get autovalidateMode => _autovalidateMode;

  setValidateMode(AutovalidateMode autovalidateMode) {
    _autovalidateMode = autovalidateMode;
    notifyListeners();
  }

  String isWrongEmail = "";
  bool isHide = true;

  // // sending parameters to the repository and then receiving response on success
  checkLogin() async {
    await login(
      email.text.replaceAll(RegExp(r"\s+"), ""),
      password.text,
    );
  }
  // sending parameters to the repository and then receiving response on success
  Future<LoginResponse?> login(
    String email,
    String password,
  ) async {
    // loading start
    startLoader();
    try {
      var response = await userRepository.login(
        email,
        password,
      );
      // loading start
      stopLoader();
      showCustomToast("Logged in successfully", success: true);
      // on success navigate to dashboard
      navigationService.navigateToReplace(AppRoutes.home);
      return response;
    } catch (error) {
      stopLoader();
    }
  }
}

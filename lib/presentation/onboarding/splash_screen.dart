import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kooha_movie_app/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/services/navigation_service.dart';
import '../../locator.dart';
import '../../routes/routes.dart';
import '../../utils/pallet.dart';
import '../../utils/widget_extensions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  NavigationService navigationService = getIt<NavigationService>();

  @override
  void initState() {
    super.initState();
    use();
  }

  use() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userToken = "${prefs.getString('token')}";
    print(userToken);
    Timer(const Duration(seconds: 3), () {
      if (userToken != "null") {
        navigationService.navigateToReplace(AppRoutes.home);
      } else {
        navigationService.navigateToReplace(AppRoutes.signIn);
      }
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SizedBox(
        width: width(context),
        height: height(context),
        child: Center(
            child: Text(
          AppStrings.appName,
          style: const TextStyle(
            color: AppColor.orange,
            fontSize: 40,
            fontFamily: 'Oliver',
            fontWeight: FontWeight.w600,
            height: 0.06,
          ),
        )),
      ),
    );
  }
}

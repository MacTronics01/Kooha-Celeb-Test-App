import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kooha_movie_app/presentation/onboarding/splash_screen.dart';
import 'package:kooha_movie_app/routes/routes.dart';
import 'package:kooha_movie_app/utils/app_strings.dart';
import 'package:oktoast/oktoast.dart';
import 'data/core/config.dart';
import 'data/services/navigation_service.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //setup different  screen orientations
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  //setup different deployment environment
  Config.appFlavor = Flavor.DEVELOPMENT;

  //setup dependency injector
  setupLocator();


  runApp(const MyApp());
      (dynamic error, dynamic stack) {
    if (kDebugMode) {
      print(error);
      print(stack);
    }
  };
}

var keyako = GlobalKey<ScaffoldMessengerState>();


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    return OKToast(
        child: ScreenUtilInit(
          //setup to fit into bigger screens
          designSize: const Size(390, 844),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (BuildContext context, Widget? child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              navigatorKey: getIt<NavigationService>().navigatorKey,
              scaffoldMessengerKey: getIt<NavigationService>().snackBarKey,
              title: AppStrings.appName,
              theme: ThemeData(primarySwatch: Colors.blue),
              onGenerateRoute: AppRouter.generateRoute,
              home: const SplashScreen(),
            );
          },
        ));
  }
}

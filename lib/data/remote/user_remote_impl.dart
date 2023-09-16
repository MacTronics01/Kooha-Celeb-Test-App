import 'package:dio/dio.dart';
import 'package:kooha_movie_app/data/remote/user_remote.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/domain/celeb_response.dart';
import '../../domain/domain/login_response.dart';
import '../../locator.dart';
import '../core/config.dart';
import '../core/network/error_handler.dart';
import '../core/network/urlPath.dart';
import '../services/app_cache.dart';
import '../services/user_services.dart';

/// This calls implements the UserRemote logic
class UserRemoteImpl extends UserRemote {
  final UserServices userServices;
  AppCache cache = getIt<AppCache>();
  final Dio dio;

  UserRemoteImpl(
    this.dio,
    this.userServices,
  );

// This make the login API call making of use of Dio
  @override
  Future<LoginResponse?> login(
    String email,
    String password,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      // the required parameters
      var dataBody = {
        'email': email,
        'password': password,
      };
      Dio _dio = Dio();
      var response = await dio.post("${Config.BASEURL}${UrlPath.login}",
          data: dataBody,
          options: Options(followRedirects: true, headers: {
            "Accept": "application/json",
          }));
      final responseData = LoginResponse.fromJson(response.data);
      // trying to get the token from the response and storing using sharedPreferences
      final token = responseData.data?.token.toString();
      prefs.setString('token', token.toString());
      return responseData;
    } on DioError catch (err) {
      handleError(err);
      rethrow;
    }
  }
  @override
  Future<CelebResponse?> getCeleb(String page, String limit, String q) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userToken = "${prefs.getString('token')}";
    try {
      // Define the required query parameters
      var queryParams = {
        "page": page,
        "limit": limit,
        "q": q,
      };
      Dio _dio = Dio();
      var response = await _dio.get(
        "${Config.BASEURL}${UrlPath.getCeleb}",
        queryParameters: queryParams,
        options: Options(
          followRedirects: true,
          headers: {
            "Accept": "application/json",
            'Authorization': "Bearer $userToken"
          },
        ),
      );
      final responseData = CelebResponse.fromJson(response.data);
      return responseData;
    } on DioError catch (err) {
      handleError(err);
      rethrow;
    }
  }



}

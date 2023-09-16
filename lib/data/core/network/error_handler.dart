import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../utils/snack_message.dart';

// This handles the errors in the app i made use of DioError
void handleError(dynamic error) {
  var errorString = error.response.toString();
  if (error is DioError) {
    switch (error.type) {
      case DioErrorType.cancel:
        break;
      case DioErrorType.connectTimeout:
        break;
      case DioErrorType.other:
        showCustomToast("Please enable internet connection to use Kooha Celeb App");
        break;
      case DioErrorType.receiveTimeout:
        break;
      case DioErrorType.response:
        final errorMessage =  error.response?.data["message"];
        if(errorMessage!=null) {
          showCustomToast(errorMessage);
          print(errorMessage);
        }else{
          showCustomToast(error.response?.data)["errors"];
        }
        break;
      case DioErrorType.sendTimeout:
        break;
      default:
        showCustomToast("Something went wrong");
        break;
    }
  } else {
    var json = jsonDecode(errorString);
    var nameJson = json['message'];
    showCustomToast(nameJson);
    throw nameJson;
  }
}
import 'dart:io';
import 'package:buro_employee/repository/network/buro_api_provider.dart';
import 'package:dio/dio.dart';

class ErrorHelper {
  static String? getErrorMessage(error) {
    print('error helper === $error');
    String? message=  "Something went wrong.";
    if (error is DioError) {
      message = error.message;
    }
    return message;
  }

  static extractApiError(DioError error) {
    String? message = "Something went wrong";
    print(
        'error === ${error.response}  ==== ${error.response != null ? error.response?.data : 'noresponse'} ==== ${error.response != null ? error.response?.extra : 'no response'}=== ${error.message}');
    if (error is DioError) {
      if (error.error is SocketException || error.type == DioExceptionType.connectionTimeout) {
        message =
            "Cannot connect to server. Make sure you have proper internet connection";
      } else if (error.response != null &&
          error.response?.data['message'] != null) {
        message = error.response?.data['message'];
      } else {
        message = error.message;
      }
    }
    return message;
  }
}

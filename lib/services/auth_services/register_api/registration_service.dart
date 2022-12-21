import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:learning_app/screens/auth/registration/model/registration_model.dart';
import 'package:learning_app/services/api_urls/api_urls.dart';

class Registerservice {
  Future<RegisterResponse> registrationApi(int phone) async {
    const url = ApiUrls.baseUrl + ApiUrls.register;
    try {
      log('1');
      final response = await Dio().post(
        url,
        data: {"institution_id": 1, "isd_code": 1, "phone": phone},
      );
      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        log(response.data.toString());
        return registerResponseFromJson(
          jsonEncode(response.data),
        );
      } else {
        return RegisterResponse(message: "Something went wrong !");
      }
    } catch (e) {
      if (e is DioError) {
        if (e.response == null) {
          return RegisterResponse(message: "no internet");
        }
        if (e.response?.data == null) {
          return RegisterResponse(message: "something went wrong !");
        } else {
          log('5');
          log(e.response!.data.toString());
          return RegisterResponse(message:"User already Exist" );
        }
      } else {
        log('6');
        log(e.toString());
        return RegisterResponse(message: "Something went wrong!");
      }
    }
  }
}

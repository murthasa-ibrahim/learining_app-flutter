import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:learning_app/services/api_urls/api_urls.dart';

import '../../../screens/auth/Login/model/login_model.dart';

class LoginServices {
  Future<LoginResponse> loginApi(int phone) async{
    const url = ApiUrls.baseUrl + ApiUrls.login;
    try {
      log('1');
      final response = await Dio().post(
        url,
        data: {"username": phone},
      );
      if(response.statusCode! >= 200 || response.statusCode! <= 299){
         log(response.data.toString());
        return loginResponseFromJson(jsonEncode(response.data));
      }
      else{
        return LoginResponse(message: "Something went wrong !"); 
      }
    } catch (e) {
      
      if (e is DioError) {
        if(e.response == null){
         return LoginResponse(message: "no internet");
         
        }
        if (e.response?.data == null) {
           
          return LoginResponse(message: "something went wrong !");
        } else {
          log('5');
          log(e.response!.data.toString());
          return LoginResponse(message: e.response?.data['message']);
        }
      } else {
        log('6');
        log(e.toString());
        return LoginResponse(message: "Something went wrong!");
      }
    }
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:learning_app/screens/dashbord/model/dashbord_model.dart';
import 'package:learning_app/services/api_urls/api_urls.dart';
import 'package:learning_app/utils/utils.dart';

class DashbordService {
  Future<DashbordModel> getDashbord() async {
    const url = ApiUrls.baseUrl + ApiUrls.getDashbord;
    // const ur = "https://qicksale.com/ept_backend/api/dashboard";
    final token = await Utils.storage.read(key: 'token');
    log(token.toString());
    try {
      final dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      dio.options.headers["Content-Type"] = "application/json";

      final response =
          await dio.post(url, data: {"category": "General", "type": "General"});


      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        log(response.data.toString());
        return dashbordModelFromJson(jsonEncode(response.data['data']));
      } else {
        throw 'Something went wrong !';
      }
    } catch (e) {
      if (e is DioError) {
        log(e.toString());
        if (e.response == null) {
          throw 'no internet !';
        }
        if (e.response?.data == null) {
          throw 'Something went wrong !';
        } else {
          log('5');
          // log(e.response!.data.toString());
          return throw 'Something went wrong !';
        }
      } else {
        log('6');
        log(e.toString());
        return throw 'Something went wrong !';
      }
    }
  }
}

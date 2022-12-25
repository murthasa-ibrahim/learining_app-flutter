import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:learning_app/screens/Excercise/model/response_model.dart';
import 'package:learning_app/screens/Excercise/model/submit_result_model.dart';
import 'package:learning_app/services/api_urls/api_urls.dart';
import 'package:learning_app/utils/utils.dart';

class SubmitResultService {
  Future<SaveResultResponse> submitResultApi(SubmitResultModel data) async {
    const url = ApiUrls.baseUrl + ApiUrls.submitResult;
    final token = await Utils.storage.read(key: 'token');
    try {
      final dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      dio.options.headers["Content-Type"] = "application/json";

      final response =
          await dio.post(url, data: submitResultModelToJson(data));


      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        log(response.data.toString());
        return saveResultResponseFromJson(jsonEncode(response.data));
      } else {
        throw 'Something went wrong !';
      }
    } catch (e) {
      
      if (e is DioError) {
        if(e.response == null){
         return SaveResultResponse(message: "no internet");
         
        }
        if (e.response?.data == null) {
           
          return SaveResultResponse(message: "something went wrong !");
        } else {
          log('5');
          log(e.response!.data.toString());
          return SaveResultResponse(message: e.response?.data['message']);
        }
      } else {
        log('6');
        log(e.toString());
        return SaveResultResponse(message: "Something went wrong!");
      }
    }
  }
}

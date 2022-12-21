
import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));


class LoginResponse {
    LoginResponse({
         this.success,
         this.data,
         this.message,
    });

    final bool? success;
    final Data? data;
    final String? message;

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
    );

}

class Data {
    Data({
        required this.token,
        required this.image,
        required this.name,
        required this.appUser,
    });

    final String token;
    final dynamic image;
    final dynamic name;
    final String appUser;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        image: json["image"],
        name: json["name"],
        appUser: json["app_user"],
    );

}

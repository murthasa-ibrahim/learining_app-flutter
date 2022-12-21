
import 'dart:convert';

RegisterResponse registerResponseFromJson(String str) => RegisterResponse.fromJson(json.decode(str));


class RegisterResponse {
    RegisterResponse({
         this.success,
         this.data,
         this.message,
    });

    final bool? success;
    final Data? data;
    final String? message;

    factory RegisterResponse.fromJson(Map<String, dynamic> json) => RegisterResponse(
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
    final int appUser;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        image: json["image"],
        name: json["name"],
        appUser: json["app_user"],
    );

}

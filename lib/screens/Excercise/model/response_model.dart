
import 'dart:convert';

SaveResultResponse saveResultResponseFromJson(String str) => SaveResultResponse.fromJson(json.decode(str));

class SaveResultResponse {
    SaveResultResponse({
         this.success,
         this.data,
         this.message,
    });

    final bool? success;
    final List<dynamic>? data;
    final String? message;

    factory SaveResultResponse.fromJson(Map<String, dynamic> json) => SaveResultResponse(
        success: json["success"],
        data: List<dynamic>.from(json["data"].map((x) => x)),
        message: json["message"],
    );

}



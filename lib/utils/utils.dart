import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Utils {
 static void showSnackBar(BuildContext context, String mesg, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mesg),
        backgroundColor: color,
      ),
    );
  }

 static const storage =  FlutterSecureStorage();

 static Future<void> storeToken(String value)async{
 await storage.write(key: 'token', value: value );
 }

 static Future<String?> getToken()async{
   return await storage.read(key: 'token',);
 }
}

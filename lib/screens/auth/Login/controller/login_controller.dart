
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/screens/navbar/view/navbar.dart';
import 'package:learning_app/services/auth_services/login_api/login_api.dart';
import 'package:learning_app/utils/utils.dart';

class LoginController extends GetxController{
  final phoneInput = TextEditingController();
  final usernameInput = TextEditingController();
  final formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

String?  validator(String? str){
    if(str == null || str.isEmpty){
      return 'Feild is required';
    }
    return null;
  }

 void onSubmit(BuildContext context){
     if(formKey.currentState!.validate()){
      isLoading.value = true;
      LoginServices().loginApi(int.parse(phoneInput.text)).whenComplete(() => isLoading.value = false).then((value){
          if(value.success == true){
            Utils.storeToken(value.data?.token??'');
             Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>  Navbar(),),);
          }
          else{
             Utils.showSnackBar(context, value.message??'', Colors.red);
          }
      },);

     }
  }
}
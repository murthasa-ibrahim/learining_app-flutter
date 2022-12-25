import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/services/auth_services/register_api/registration_service.dart';

import '../../../../utils/utils.dart';
import '../../../dashbord/view/dashbord_view.dart';

class RegisterController extends GetxController {
  final nameInput = TextEditingController();
  final phoneInput = TextEditingController();
  final emailInput = TextEditingController();
  final formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  String? validator(String? str) {
    if (str == null || str.isEmpty) {
      return 'feild is required';
    }
    return null;
  }

  void onSubmit(BuildContext context) {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      Registerservice()
          .registrationApi(int.parse(phoneInput.text))
          .whenComplete(() => isLoading.value = false)
          .then(
        (value) {
          if (value.success == true) {
          Utils.storeToken(value.data?.token??'');
          Utils.storage.write(key: 'username', value: nameInput.text);
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const DashBordView(),
              ),
            );
          } else {
            Utils.showSnackBar(context, value.message ?? '', Colors.red);
          }
        },
      );
    }
  }
}

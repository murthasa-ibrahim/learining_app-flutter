import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/const/constant.dart';

import '../../Login/view/login_view.dart';
import '../controller/register_controller.dart';

class RegistrationView extends GetView {
   RegistrationView({Key? key}) : super(key: key);
final regController = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Register",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: kwhight),
              ),
              kheight,
              Form(
                key: regController.formKey,
                child: TextFormField(
                  validator: (value) => regController.validator(value),
                  controller: regController.phoneInput,
                  decoration: InputDecoration(
                    fillColor: Colors.teal,
                    filled: true,
                    hintText: 'Phone',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              kheight,
              TextFormField(
                controller: regController.passwordInput,
                decoration: InputDecoration(
                  fillColor: Colors.teal,
                  filled: true,
                  hintText: 'password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              ksmallHeight,
              Obx(() => 
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      regController.onSubmit(context);
                    },
                    child: regController.isLoading.value
                    ? const Center(child: CircularProgressIndicator(color: Colors.teal,),)
                    : const Text('Submit'),
                  ),
                ),
              ),
              Row(
                children: [
                  const Spacer(),
                  const Text(
                    " Have an account already?",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  TextButton(
                    onPressed: () =>
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) =>  LoginView(),
                    )),
                    child: const Text(
                      " Sign in",
                      style: TextStyle(color: Colors.blueAccent, fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    width: 13,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

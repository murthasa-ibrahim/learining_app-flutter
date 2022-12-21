import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/const/constant.dart';

import '../../registration/view/registraion_view.dart';
import '../controller/login_controller.dart';

class LoginView extends GetView {
   LoginView({Key? key}) : super(key: key);
final loginController = Get.put(LoginController());
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
                "Login",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: kwhight),
              ),
              kheight,
              Form(
                key: loginController.formKey,
                child: TextFormField(
                  validator: (value) => loginController.validator(value),
                  controller: loginController.phoneInput,
                  keyboardType: TextInputType.number,
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
                controller: loginController.passwordInput,
                decoration: InputDecoration(
                  fillColor: Colors.teal,
                  filled: true,
                  hintText: 'password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              kheight,
              Obx(() => 
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      loginController.onSubmit(context);
                    },
                    child: loginController.isLoading.value
                    ? const Center(child: CircularProgressIndicator(color: Colors.teal,),)
                    : const Text('Submit'),
                  ),
                ),
              ),
              Row(
                children: [
                  const Spacer(),
                  Row(
                    children: [
                      const Text(
                        " Don't have an account?",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) =>  RegistrationView(),
                            ),
                          );
                        },
                        child: const Text(
                          "Create",
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ],
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

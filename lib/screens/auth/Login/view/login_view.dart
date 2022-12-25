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
    return Container(
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/logwalp.jpg'),fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
                    TextFormField(
                  controller: loginController.usernameInput,
                  decoration: InputDecoration(
                    fillColor: kwhight,
                    filled: true,
                    hintText: 'Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                kheight,
                Form(
                  key: loginController.formKey,
                  child: TextFormField(
                    validator: (value) => loginController.validator(value),
                    controller: loginController.phoneInput,
                    decoration: InputDecoration(
                      fillColor: kwhight,
                      filled: true,
                      hintText: 'Email or phone',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
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
                      style: ElevatedButton.styleFrom(primary: kblack),
                      child: loginController.isLoading.value
                      ? const Center(child: CircularProgressIndicator(color: Colors.teal,),)
                      : const Text('Submit',style: TextStyle(color: kwhight),),
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
      ),
    );
  }
}

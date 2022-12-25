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
    return Container(
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/logwalp.jpg'),fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                const  SizedBox(height: 150,),
                  Text(
                    "Registration",
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: kwhight),
                  ),
                  kheight,
                   Form(
                    key: regController.formKey,
                     child: Column(
                       children: [
                         TextFormField(
                          controller: regController.nameInput,
                          validator: (value) => regController.validator(value),
                          decoration: InputDecoration(
                            fillColor: kwhight,
                            filled: true,
                            hintText: 'name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                                   ),
                                   kheight,
                                   TextFormField(
                      validator: (value) => regController.validator(value),
                      controller: regController.phoneInput,
                      decoration: InputDecoration(
                        fillColor: kwhight,
                        filled: true,
                        hintText: 'Phone number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                                   ),
                                   kheight,
                                   TextFormField(
                      controller: regController.emailInput,
                      validator: (value) => regController.validator(value),
                      decoration: InputDecoration(
                        fillColor: kwhight,
                        filled: true,
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                                   ),
                                   kheight,
                       ],
                     ),
                   ),
                  
                  Obx(() => 
                    SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          regController.onSubmit(context);
                        },
                        style: ElevatedButton.styleFrom(primary: kblack),
                        child: regController.isLoading.value
                        ? const Center(child: CircularProgressIndicator(color: Colors.teal,),)
                        : const Text('Register',style: TextStyle(color: kwhight),),
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
        ),
      ),
    );
  }
}

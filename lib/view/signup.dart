import 'package:flutter/material.dart';
import 'package:flutter_mid_level/Controllers/login_controller.dart';
import 'package:flutter_mid_level/Controllers/signup_controller.dart';
import 'package:flutter_mid_level/utils/screen_size.dart';
import 'package:flutter_mid_level/view/login.dart';
import 'package:flutter_mid_level/widgets/widgets.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final controller = Get.put(SignUpController());
    final login_controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding:
            EdgeInsets.all(ScreenSize(context: context).getHeight() * 0.05),
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      fontSize: ScreenSize(context: context).fontSize(50),
                      color: Colors.red),
                ),
              ),
              TextFormField(
                  controller: controller.name,
                  decoration:
                      myDecoration(const Icon(Icons.person), "Username"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Required";
                    }
                    return null;
                  }),

              //
              TextFormField(
                  controller: controller.email,
                  decoration: myDecoration(const Icon(Icons.email), "Email"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Required";
                    } else if (!controller.isValidEmail(value)) {
                      return "Enter a valid email";
                    }
                    return null;
                  }),

              //
              TextFormField(
                  obscureText: true,
                  controller: controller.password,
                  decoration:
                      myDecoration(const Icon(Icons.password), "Password"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Required";
                    } else if (value.length < 8) {
                      return "Short Password";
                    }
                    return null;
                  }),
              //const SizedBox(height: 20),
              TextFormField(
                  obscureText: true,
                  controller: controller.repassword,
                  decoration: myDecoration(
                      const Icon(Icons.password), "Confirm Password"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Required";
                    } else if (value.length < 8) {
                      return "Short Password";
                    } else if (controller.password.text !=
                        controller.repassword.text) {
                      return "Password doesn't match";
                    }
                    return null;
                  }),
              //
              GestureDetector(
                onTap: () {
                  if (controller.formKey.currentState!.validate()) {
                    print("Donnnnnnnnnnnnnnnnne");
                    controller.signUp(context);
                  } else {
                    print("errorrrrrrrrrrrrrrrrrrrrrrrrrr");
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: ScreenSize(context: context).getHeight()*0.07,
                  width: ScreenSize(context: context).getWidth(),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text("Sign Up"),
                ),
              ),
              //
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("I already have account "),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => LoginScreen());
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.red),
                    ),
                  )
                ],
              ),
              //
              const Text("Or Continue With"),
              //
              GestureDetector(
                        onTap: (){
                          login_controller.signInWithGoogle();
                        },
                        child: Container(
                          width: ScreenSize(context: context).getWidth()*0.5,
                          height: ScreenSize(context: context).getHeight()*0.08,
                          padding:const EdgeInsets.all(10),
                                child:Image.asset("assets/google.png"),
                            
                                  ),
                      )
            ],
          ),
        ),
      ),
    );
  }
}

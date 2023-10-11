import 'package:flutter/material.dart';
import 'package:flutter_mid_level/Controllers/login_controller.dart';
import 'package:flutter_mid_level/utils/screen_size.dart';
import 'package:flutter_mid_level/view/signup.dart';
import 'package:flutter_mid_level/widgets/widgets.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Obx(
        () => controller.isLoading.value
            ? showLoading()
            : Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenSize(context: context).getHeight() * 0.04,
                    vertical: ScreenSize(context: context).getHeight() * 0.07),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: ScreenSize(context: context).getWidth() * 0.2,
                        backgroundImage: const AssetImage("assets/logo.png"),
                      ),
                      SizedBox(
                          height:
                              ScreenSize(context: context).getHeight() * 0.05),
                      TextFormField(
                        onTapOutside: (event) {
                          FocusManager.instance.primaryFocus!.unfocus();
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Required";
                          }
                          if (!controller.isValidEmail(val)) {
                            return "Enter a valid Email";
                          }
                          return null;
                        },
                        controller: controller.email,
                        decoration:
                            myDecoration(const Icon(Icons.email), "Email"),
                      ),
                      SizedBox(
                          height:
                              ScreenSize(context: context).getHeight() * 0.03),
                      TextFormField(
                          onTapOutside: (event) {
                            FocusManager.instance.primaryFocus!.unfocus();
                          },
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required";
                            }
                            if (value.length < 8) {
                              return "Short Password";
                            }

                            return null;
                          },
                          controller: controller.password,
                          decoration: myDecoration(
                              const Icon(Icons.password), "Password")),
                      SizedBox(
                          height:
                              ScreenSize(context: context).getHeight() * 0.03),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Forget My Password",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.red),
                        ),
                      ),
                      SizedBox(
                          height:
                              ScreenSize(context: context).getHeight() * 0.03),
                      GestureDetector(
                        onTap: () {
                          controller.login(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height:
                              ScreenSize(context: context).getHeight() * 0.06,
                          width: ScreenSize(context: context).getWidth(),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)),
                          child:  Text("Login",style:TextStyle(
                            fontSize: ScreenSize(context: context).fontSize(25)
                          )),
                        ),
                      ),
                      SizedBox(
                          height:
                              ScreenSize(context: context).getHeight() * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Dont have account? "),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => SignUpScreen());
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.red,
                                  decoration: TextDecoration.underline),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                          height:
                              ScreenSize(context: context).getHeight() * 0.07),
                      const Text("Or Continue With"),
                      const SizedBox(height: 50),
                      GestureDetector(
                        onTap: (){
                          controller.signInWithGoogle();
                        },
                        child: Container(
                          width: ScreenSize(context: context).getWidth()*0.5,
                          height: ScreenSize(context: context).getHeight()*0.08,
                          padding:const EdgeInsets.all(10),
                                child:Image.asset("assets/google.png"),
                            
                                  ),
                      )        
                  ]),
                ),
              ),
      )));
  }
}

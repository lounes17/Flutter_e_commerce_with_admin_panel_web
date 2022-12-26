import 'package:application_mobile/logic/controllers/auth_controller.dart';
import 'package:application_mobile/routes/routes.dart';
import 'package:application_mobile/utils/my_string.dart';
import 'package:application_mobile/utils/theme.dart';
import 'package:application_mobile/view/widgets/auth/auth_button.dart';
import 'package:application_mobile/view/widgets/auth/auth_text_from_field.dart';
import 'package:application_mobile/view/widgets/auth/check_widget.dart';
import 'package:application_mobile/view/widgets/auth/container_under.dart';
import 'package:application_mobile/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget
{
  SignUpScreen({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController() ;
  final TextEditingController emailController = TextEditingController() ;
  final TextEditingController passwordController = TextEditingController() ;
  final fromKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();



  @override
  Widget build(BuildContext context)
  {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
            elevation: 0,
          ),
          backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children:
              [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 1.3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 40.0,),
                    child: Form(
                      key: fromKey ,
                      child: Column(
                        children:
                        [
                          Row(
                            children:
                            [
                              TextUtils(
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.w500,
                                  text: "Sign Up".tr,
                                  color: mainColor,
                                  underline: TextDecoration.none,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 50.0,
                          ),
                          AuthTextFromField(
                            controller: nameController,
                            obscureText: false,
                            validator: (value)
                            {
                              if (value.toString().length <= 2 || !RegExp(validationName).hasMatch(value))
                              {
                                return 'Enter valid name'.tr;
                              } else
                              {
                                return null;
                              }
                            },
                            prefixIcon: const Icon(Icons.person, color: pinkClr, size: 30,),
                            suffixIcon: const Text(""),
                            hintText: "User Name".tr,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AuthTextFromField(
                            controller: emailController,
                            obscureText: false,
                            validator: (value)
                            {
                              if(!RegExp(validationEmail).hasMatch(value))
                              {
                                return 'Invalid email'.tr;
                              } else
                              {
                                return null;
                              }
                            },
                            prefixIcon: const Icon(Icons.email_rounded, color: pinkClr, size: 30,),
                            suffixIcon: const Text(""),
                            hintText: "Email".tr,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GetBuilder<AuthController>(
                              builder: (_)
                              {
                                return AuthTextFromField(
                                  controller: passwordController,
                                  obscureText: controller.isVisibility ? false : true,
                                  validator: (value)
                                  {
                                    if (value.toString().length < 6)
                                    {
                                      return 'Password too short'.tr;
                                    } else
                                    {
                                      return null;
                                    }
                                  },
                                  prefixIcon: const Icon(Icons.lock, color: pinkClr, size: 30,),
                                  suffixIcon: IconButton(
                                    onPressed: ()
                                    {
                                      controller.visibility();
                                    },
                                    icon: controller.isVisibility ? const Icon(Icons.visibility_off, color: pinkClr,) : const Icon(Icons.visibility, color: mainColor,),
                                  ),
                                  hintText: "Password".tr,
                                );
                              },
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          CheckWidget(),
                          const SizedBox(
                            height: 50,
                          ),
                          GetBuilder<AuthController>
                            (
                              builder: (_)
                              {
                                return AuthButton
                                  (
                                    onPressed: ()
                                    {
                                      if(controller.isCheckBox == false)
                                      {
                                        Get.snackbar(
                                            "Check Box".tr,
                                            "Please accept terms and conditions".tr,
                                          snackPosition: SnackPosition.BOTTOM,
                                          backgroundColor: Colors.red,
                                          colorText: Colors.black,
                                        );
                                      }
                                      else if(fromKey.currentState!.validate())
                                      {
                                        String name = nameController.text.trim();
                                        String email = emailController.text.trim();
                                        String password = passwordController.text;

                                        controller.signUpUsingFirebase(
                                            name: name,
                                            email: email,
                                            password: password,
                                        );
                                        controller.isCheckBox = true;
                                      }
                                    },
                                    text: "SIGN UP".tr,
                                  );
                              }
                            ),
                          ],
                      ),
                    ),
                  ),
                ),
                ContainerUnder(
                  text: 'Already have an account ? '.tr,
                  onPressed: ()
                  {
                    Get.offNamed(Routes.loginScreen);
                  },
                  textType: 'Log in'.tr,
                ),
              ],
            ),
          ),
        ),
    );


  }
}

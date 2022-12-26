import 'package:application_mobile/logic/controllers/auth_controller.dart';
import 'package:application_mobile/utils/my_string.dart';
import 'package:application_mobile/utils/theme.dart';
import 'package:application_mobile/view/widgets/auth/auth_button.dart';
import 'package:application_mobile/view/widgets/auth/auth_text_from_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget
{
  ForgotPasswordScreen ({Key? key}) : super(key: key);


  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();


  @override
  Widget build(BuildContext context)
{
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
            elevation: 0,
            title: Text(
              "Forgot Password".tr,
              style: TextStyle(
                color: mainColor,
              ),
            ),
            leading: IconButton(
              onPressed: ()
              {
                Get.back();
              },
              icon: Icon(Icons.arrow_back, color: pinkClr,),

            ),
          ),
          backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const  EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children:
                  [
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(Icons.close_rounded, color: pinkClr,),
                        onPressed: ()
                        {
                          Get.back();
                        },

                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "If you want to recover your account, then please provide your email ID below...".tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Image.asset(
                      "assets/images/forgetpass copy.png",
                      width: 300,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    AuthTextFromField(
                      controller: emailController,
                      obscureText: false,
                      validator: (value)
                      {
                        if (!RegExp(validationEmail).hasMatch(value))
                        {
                          return 'Invalid email'.tr;
                        } else
                        {
                          return null;
                        }
                      },
                      prefixIcon: const Icon(
                        Icons.email,
                        color: pinkClr,
                        size: 30,
                      ),
                      suffixIcon: const Text(""),
                      hintText: 'Email'.tr,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GetBuilder<AuthController>(builder: (_)
                    {
                      return AuthButton(
                        onPressed: ()
                        {
                          if(formKey.currentState!.validate())
                          {
                            String email = emailController.text.trim();
                            controller.resetPassword(email);
                          }
                        },
                        text: 'SEND'.tr,
                      );
                    })
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}

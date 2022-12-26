import 'package:application_mobile/logic/controllers/auth_controller.dart';
import 'package:application_mobile/routes/routes.dart';
import 'package:application_mobile/utils/my_string.dart';
import 'package:application_mobile/utils/theme.dart';
import 'package:application_mobile/view/widgets/auth/auth_button.dart';
import 'package:application_mobile/view/widgets/auth/auth_text_from_field.dart';
import 'package:application_mobile/view/widgets/auth/container_under.dart';
import 'package:application_mobile/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget
{
  LoginScreen({Key? key}) : super(key: key);

  final fromKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
          elevation: 0,
        ),
        body: Container(
          color: Get.isDarkMode ? Colors.black : Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children:
              [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 1.3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
                    child: Form(
                      key: fromKey,
                      child: Column(
                        children:
                        [
                          Row(
                            children:
                            [
                              TextUtils(
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                text: "LOG IN".tr,
                                color: mainColor,
                                underline: TextDecoration.none,
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          const SizedBox(
                            height: 20,
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
                            height: 20,
                          ),
                          GetBuilder<AuthController>(
                            builder: (_)
                            {
                              return AuthTextFromField(
                                controller: passwordController,
                                obscureText:
                                controller.isVisibility ? false : true,
                                validator: (value)
                                {
                                  if (value.toString().length < 6)
                                  {
                                    return 'Password should be longer or equal to 6 characters'.tr;
                                  } else
                                  {
                                    return null;
                                  }
                                },
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: pinkClr,
                                  size: 30,
                                ),
                                hintText: 'Password'.tr,
                                suffixIcon: IconButton(
                                  onPressed: ()
                                  {
                                    controller.visibility();
                                  },
                                  icon: controller.isVisibility
                                      ? const Icon(
                                    Icons.visibility_off,
                                    color: pinkClr,
                                  )
                                      : const Icon(
                                    Icons.visibility,
                                    color: pinkClr,
                                  ),
                                ),
                              );
                            },
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: ()
                              {
                                Get.toNamed(Routes.forgotPasswordScreen);
                              },
                              child: TextUtils(
                                text: 'Forgot Password ?'.tr,
                                fontSize: 14,
                                color: Get.isDarkMode ? Colors.white : Colors.black,
                                underline: TextDecoration.none,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          GetBuilder<AuthController>(builder: (_)
                          {
                            return AuthButton(
                              onPressed: ()
                              {
                                if (fromKey.currentState!.validate())
                                {
                                  String email = emailController.text.trim();
                                  String password = passwordController.text;

                                  controller.logInUsingFirebase(
                                      email: email,
                                      password: password,
                                  );
                                }
                              },
                              text: "LOG IN".tr,
                            );
                          }),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ContainerUnder(
                  text: "Don't have an account ?".tr,
                  textType: "Sign up".tr,
                  onPressed: ()
                  {
                    Get.offNamed(Routes.signUpScreen);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
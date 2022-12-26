import 'package:application_mobile/routes/routes.dart';
import 'package:application_mobile/utils/theme.dart';
import 'package:application_mobile/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget
{
  const WelcomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context)
  {
    return SafeArea(
        child: Scaffold(
          body: Stack(
            children:
            [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset('assets/images/shopping 2.jpg',
                fit: BoxFit.cover,
                ),
              ),
              Container(
                color: Colors.black.withOpacity(0.2),
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    const SizedBox(
                      height: 100.0,
                    ),
                    Container(
                      height: 60.0,
                      width: 190.0,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: TextUtils(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          text: 'Welcome'.tr,
                          color: Colors.white,
                          underline: TextDecoration.none,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      height: 60.0,
                      width: 280.0,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: TextUtils(
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold,
                              text: 'BACHA Shop',
                              color: mainColor,
                              underline: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 250.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40.0,
                          vertical: 12.0,
                        )
                      ),
                      onPressed: ()
                      {
                        Get.offNamed(Routes.loginScreen);
                      },
                      child: TextUtils(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        text: "Get start".tr,
                        underline: TextDecoration.none,
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                      [
                        TextUtils(
                            fontSize: 18.0,
                            fontWeight: FontWeight.normal,
                            text:"Don't have an account ?".tr,
                            color: Colors.white,
                            underline: TextDecoration.none,
                        ),
                        TextButton(
                            onPressed: ()
                            {
                              Get.offNamed(Routes.signUpScreen);
                            },
                            child: TextUtils(
                                fontSize: 18.0,
                                fontWeight: FontWeight.normal,
                                text: "Sign up".tr,
                                color: Colors.white,
                                underline: TextDecoration.underline,
                            ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}

import 'package:application_mobile/utils/theme.dart';
import 'package:application_mobile/view/screens/admin_screen.dart';
import 'package:application_mobile/view/widgets/setting/dark_mode_widget.dart';
import 'package:application_mobile/view/widgets/setting/language_widget.dart';
import 'package:application_mobile/view/widgets/setting/logout_widget.dart';
import 'package:application_mobile/view/widgets/setting/profile_widget.dart';
import 'package:application_mobile/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controllers/auth_controller.dart';

class SettingsScreen extends StatelessWidget
{
   SettingsScreen({Key? key}) : super(key: key); //

  final authController = Get.find<AuthController>();



  @override//
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Column(
        children:<Widget>
        [
          ProfileWidget(),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: Get.isDarkMode ? Colors.white : Colors.grey,
            thickness: 2,
          ),
          const SizedBox(
            height: 20,
          ),
          TextUtils(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              text: "GENERAL".tr,
              color: mainColor,
              underline: TextDecoration.none,
          ),
          const SizedBox(
            height: 20,
          ),
          DarkModeWidget(),
          const SizedBox(
            height: 20,
          ),
          LanguageWidget(),
          const SizedBox(
            height: 20,
          ),
  if(authController.displayUserEmail.value.toString()=="lounes.abbar@gmail.com"){
  <Widget>
  }else{

  }



          LogOutWidget(),
        ],
      ),
    );
  }
}

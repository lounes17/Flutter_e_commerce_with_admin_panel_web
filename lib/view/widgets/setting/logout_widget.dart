import 'package:application_mobile/logic/controllers/auth_controller.dart';
import 'package:application_mobile/utils/theme.dart';
import 'package:application_mobile/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogOutWidget extends StatelessWidget
{
  LogOutWidget({Key? key}) : super(key: key);

  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context)
  {
    return GetBuilder<AuthController>
      (
      builder: (_)
      => Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: ()
          {
            Get.defaultDialog(
              title: "Log out from app".tr,
              titleStyle: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              middleText: "Are you sure you need to log out from app ?".tr,
              middleTextStyle: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              backgroundColor: Colors.grey[300],
              radius: 10,
              textCancel: " NO ".tr,
              cancelTextColor: Colors.red,
              textConfirm: " YES ".tr,
              confirmTextColor: Colors.green,
              onCancel: ()
              {
                Get.back();
              },
              onConfirm: ()
              {
                controller.signOutFromApp();
              },
              buttonColor: Colors.white,
            );
          },
          splashColor: mainColor,
          borderRadius: BorderRadius.circular(12),
          customBorder: const StadiumBorder(),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: logOutSettings,
                ),
                child: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              TextUtils(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                text: "Log out".tr,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underline: TextDecoration.none,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
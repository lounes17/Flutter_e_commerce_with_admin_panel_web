import 'package:application_mobile/logic/controllers/auth_controller.dart';
import 'package:application_mobile/utils/theme.dart';
import 'package:application_mobile/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckWidget extends StatelessWidget
{
  CheckWidget({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context)
  {
    return GetBuilder<AuthController>(
        builder: (_)
        {
          return Row(
            children:
            [
              InkWell(
                onTap: ()
                {
                  controller.checkBox();
                },
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: controller.isCheckBox ? Image.asset('assets/images/check.png',color: pinkClr,) : Container(),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Row(
                children:
                [
                  TextUtils(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    text: 'I accept '.tr,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    underline: TextDecoration.none,
                  ),
                  TextUtils(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    text: 'terms and conditions'.tr,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    underline: TextDecoration.underline,
                  ),
                ],
              ),
            ],
          );
        },
    );
  }
}

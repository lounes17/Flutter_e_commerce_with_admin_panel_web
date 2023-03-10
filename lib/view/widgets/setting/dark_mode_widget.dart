import 'package:application_mobile/logic/controllers/settings_controller.dart';
import 'package:application_mobile/logic/controllers/theme_controller.dart';
import 'package:application_mobile/utils/theme.dart';
import 'package:application_mobile/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DarkModeWidget extends StatelessWidget
{
  DarkModeWidget({Key? key}) : super(key: key);
  final controller = Get.find<SettingController>();

  @override
  Widget build(BuildContext context)
  {
    return Obx(()
    => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:
      [
        buildIconWidget(),
        Switch(
          activeTrackColor: mainColor,
          activeColor: mainColor,
          value: controller.switchValue.value,
          onChanged: (value)
          {
            ThemeController().changesTheme();
            controller.switchValue.value = value;
          },
        ),
      ],
    ),
    );
  }




  Widget buildIconWidget()
  {
    return Material(
      color: Colors.transparent,
      child: Row(
        children:
        [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: darkSettings,
            ),
            child: const Icon(
              Icons.dark_mode,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          TextUtils(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              text: "Dark Mode".tr,
              color: Get.isDarkMode ? Colors.white : Colors.black,
              underline: TextDecoration.none,
          ),
        ],
      ),
    );
  }
}

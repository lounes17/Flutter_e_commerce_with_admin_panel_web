import 'package:badges/badges.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:flutter/material.dart';
import '../../logic/controllers/auth_controller.dart';
import '../../logic/controllers/cart_controller.dart';
import '../../routes/routes.dart';
import '../../utils/theme.dart';
import '../widgets/text_utils.dart';
import 'package:application_mobile/logic/controllers/main_controller.dart';


class AdminScreen extends StatelessWidget {
   AdminScreen({Key? key}) : super(key: key);
   final authController = Get.find<AuthController>();
   final cartController = Get.find<CartController>();
   final controller = Get.put(AuthController());


   @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Text("Admin "

      ) ,
    );
  }
}

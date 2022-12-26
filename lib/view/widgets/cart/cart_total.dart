import 'package:application_mobile/logic/controllers/cart_controller.dart';
import 'package:application_mobile/routes/routes.dart';
import 'package:application_mobile/utils/theme.dart';
import 'package:application_mobile/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartTotal extends StatelessWidget
{
  CartTotal ({Key? key}) : super(key: key);
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context)
  {
    return Obx(()
        => Container(
          padding: const EdgeInsets.all(25),
          child: Row(
            children:
            [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  TextUtils(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    text: "Total",
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    underline: TextDecoration.none,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextUtils(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    text: "\$${controller.total}",
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    underline: TextDecoration.none,
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: SizedBox(
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 0,
                      primary: mainColor,
                    ),
                    onPressed: ()
                    {
                      Get.offNamed(Routes.paymentScreen);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                      [
                        Text(
                          "Check Out".tr,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(Icons.shopping_cart,),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}

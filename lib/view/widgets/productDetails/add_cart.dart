import 'package:application_mobile/logic/controllers/cart_controller.dart';
import 'package:application_mobile/model/product_models.dart';
import 'package:application_mobile/utils/theme.dart';
import 'package:application_mobile/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCart extends StatelessWidget
{
  final double price;
  final controller = Get.find<CartController>();
  final ProductModels productModels;
  AddCart(
      {
        required this.productModels,
        required this.price,
        Key? key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Container(
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
                  text: "Price".tr,
                  color: Colors.grey,
                  underline: TextDecoration.none,
              ),
              Text(
                "\$$price",
                style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
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
                    controller.addProductToCart(productModels);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      Text(
                        "Add to cart".tr,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                    ],
                  ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:application_mobile/routes/routes.dart';
import 'package:application_mobile/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyCart extends StatelessWidget
{
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
        [
          Icon(
            Icons.shopping_cart,
            size: 150,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
          const SizedBox(
              height: 40,
          ),
          RichText(
              text: TextSpan(
                children:
                [
                  TextSpan(
                    text: "Your cart is Empty".tr,
                    style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    )
                  ),
                ],
              ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Add items to get started".tr,
            style: TextStyle(
              color: Get.isDarkMode ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
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
                  Get.toNamed(Routes.mainScreen);
                },
                child: Text(
                    "Go to home".tr,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
            ),
          ),
        ],
      ),
    );
  }
}

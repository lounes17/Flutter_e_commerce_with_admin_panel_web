import 'package:application_mobile/utils/theme.dart';
import 'package:application_mobile/view/widgets/payment/delivery_container_widget.dart';
import 'package:application_mobile/view/widgets/payment/payment_method_widget.dart';
import 'package:application_mobile/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatelessWidget
{
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: const Text("Payment"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: mainColor,

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              TextUtils(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  text: "Shipping to".tr,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underline: TextDecoration.none,
              ),
              const SizedBox(height: 20,),
              const DeliveryContainerWidget(),
              const SizedBox(height: 20,),
              TextUtils(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                text: "Payment method".tr,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underline: TextDecoration.none,
              ),
              const SizedBox(height: 20,),
              const PaymentMethodWidget(),
              const SizedBox(height: 30,),
              Center(
                child: TextUtils(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    text: "Total:  200\$",
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    underline: TextDecoration.none,
                ),
              ),
              const SizedBox(height: 20,),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                      primary: mainColor,
                    ),
                    onPressed: () {},
                    child: Text(
                      "Pay now".tr,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ),
              //TotalButton(),



            ],
          ),
        ),
      ),
    );
  }
}

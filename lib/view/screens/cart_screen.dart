import 'package:application_mobile/logic/controllers/cart_controller.dart';
import 'package:application_mobile/utils/theme.dart';
import 'package:application_mobile/view/widgets/cart/cart_product_card.dart';
import 'package:application_mobile/view/widgets/cart/cart_total.dart';
import 'package:application_mobile/view/widgets/cart/empty_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget
{
  CartScreen({Key? key}) : super(key: key);
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context)
  {
    return SafeArea(
        child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            title:  Text("Cart items".tr),
            elevation: 0,
            centerTitle: true,
            backgroundColor: mainColor,
            actions:
            [
              IconButton(
                  onPressed: ()
                  {
                    controller.clearAllProducts();
                  },
                  icon: const Icon(Icons.backspace),
              ),
            ],
          ),
          body: Obx(()
          {
            if(controller.productsMap.isEmpty)
            {
              return const EmptyCart();
            } else
            {
              return SingleChildScrollView(
                child: Column(
                  children:
                  [
                    SizedBox(
                      height: 600,
                      child: ListView.separated(
                        itemBuilder: (context, index)
                        {
                          return CartProductCard(
                            quantity: controller.productsMap.values.toList()[index],
                            index: index,
                            productModels: controller.productsMap.keys.toList()[index],
                          );
                        } ,
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                        itemCount: controller.productsMap.length,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30,),
                      child: CartTotal(),
                    ),
                  ],
                ),
              );
            }
          })
        )
    );
  }
}

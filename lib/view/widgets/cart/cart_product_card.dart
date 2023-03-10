import 'package:application_mobile/logic/controllers/cart_controller.dart';
import 'package:application_mobile/model/product_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartProductCard extends StatelessWidget
{
  CartProductCard({
    required this.productModels,
    required this.index,
    required this.quantity,
    Key? key,
  }) : super(key: key);
  final ProductModels productModels;
  final controller = Get.find<CartController>();
  final int index;
  final int quantity;

  @override
  Widget build(BuildContext context)
  {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
      height: 130,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
        [
          Container(
            height: 120,
            width: 100,
            margin: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(productModels.image),
                fit: BoxFit.cover,
              )
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: 
              [
                Text(
                  productModels.title,
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "\$${controller.productSubTotal[index].toStringAsFixed(2)}",
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children:
            [
              Row(
                children:
                [
                  IconButton(
                      onPressed: ()
                      {
                        controller.removeProductFromCart(productModels);
                      },
                      icon: const Icon(Icons.remove_circle),
                  ),
                  Text(
                    "$quantity",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    onPressed: ()
                    {
                      controller.addProductToCart(productModels);
                    },
                    icon: const Icon(Icons.add_circle),
                  ),
                ],
              ),
              IconButton(
                  onPressed: ()
                  {
                    controller.removeOneProduct(productModels);
                  },
                  icon: const  Icon(
                    Icons.delete,
                    size: 20,
                    color: Colors.red,
                  ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

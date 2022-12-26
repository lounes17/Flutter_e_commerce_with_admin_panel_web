import 'package:application_mobile/model/product_models.dart';
import 'package:application_mobile/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController
{
  var productsMap = {}.obs;


  void addProductToCart(ProductModels productModels)
  {
    if(productsMap.containsKey(productModels))
    {
      productsMap[productModels] += 1 ;
    } else
       {
         productsMap[productModels] = 1 ;
       }
  }



  void removeProductFromCart(ProductModels productModels)
  {
    if( productsMap.containsKey(productModels) && productsMap[productModels] == 1 )
    {
      productsMap.removeWhere( (key, value) => key == productModels );
    } else
    {
      productsMap[productModels] -= 1;
    }
  }



  void removeOneProduct(ProductModels productModels)
  {
    productsMap.removeWhere( (key, value) => key == productModels );

  }




  void clearAllProducts()
  {
    Get.defaultDialog(
      title: "Clean Products".tr,
      titleStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      middleText: "Are you sure you need to clear products ?".tr,
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
        Get.toNamed(Routes.cartScreen);
      },
      onConfirm: ()
      {
        productsMap.clear();
        Get.back();
      },
      buttonColor: Colors.white,
    );
  }


  get productSubTotal => productsMap.entries.map((e) => e.key.price * e.value).toList();

  get total => productsMap.entries.map((e) => e.key.price * e.value).toList().reduce((value, element) => value + element).toStringAsFixed(2);


  int quantity()
  {
    if(productsMap.isEmpty)
    {
      return 0;
    } else
    {
      return productsMap.entries.map((e) => e.value).toList().reduce( (value, element) => value + element );
    }
  }



}
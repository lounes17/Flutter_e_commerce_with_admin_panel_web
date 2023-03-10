import 'package:application_mobile/logic/controllers/cart_controller.dart';
import 'package:application_mobile/logic/controllers/category_controller.dart';
import 'package:application_mobile/logic/controllers/product_controller.dart';
import 'package:application_mobile/model/product_models.dart';
import 'package:application_mobile/utils/theme.dart';
import 'package:application_mobile/view/screens/product_details_screen.dart';
import 'package:application_mobile/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItems extends StatelessWidget
{
  CategoryItems(
      {
        required this.categoryTitle,
        Key? key,
      }) : super(key: key);
  final controller = Get.find<ProductController>();
  final cartController = Get.find<CartController>();
  final categoryController = Get.find<CategoryController>();
  final String categoryTitle;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: Text(categoryTitle,),
        centerTitle: true,
        backgroundColor: mainColor,
      ),
      body: Obx(()
      {
        if(categoryController.isAllCategory.value)
        {
          return const Center(
            child: CircularProgressIndicator(
              color: mainColor,
            ),
          );
        } else
           {
             return GridView.builder(
               itemCount: categoryController.categoryList.length,
               gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                 childAspectRatio: 0.8,
                 mainAxisSpacing: 9.0,
                 crossAxisSpacing: 6.0,
                 maxCrossAxisExtent: 200,
               ),
               itemBuilder: (context, index)
               {
                 return buildCardItems(
                     image: categoryController.categoryList[index].image,
                     price: categoryController.categoryList[index].price,
                     rate: categoryController.categoryList[index].rating.rate,
                     productId: categoryController.categoryList[index].id,
                     productModels: categoryController.categoryList[index],
                     onTap: ()
                     {
                       Get.to(() =>ProductDetailsScreen(
                         productModels: categoryController.categoryList[index],
                       ));
                     }
                 );
               },
             );
           }
      }),
    );
  }



  Widget buildCardItems(
      {
        required String image,
        required double price,
        required double rate,
        required int productId,
        required ProductModels productModels,
        required Function() onTap,
      })
  {
    return  Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow:
            [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Column(
            children:
            [
              Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                [
                  IconButton(
                    onPressed: ()
                    {
                      controller.manageFavorites(productId);
                    },
                    icon: controller.isFavorites(productId) ?
                    const Icon(Icons.favorite, color: Colors.red,) : const Icon(Icons.favorite_outline, color: Colors.black,),
                  ),
                  IconButton(
                    onPressed: ()
                    {
                      cartController.addProductToCart(productModels);
                    },
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              ),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10, ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                  [
                    TextUtils(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      text: "\$ $price",
                      color: Colors.black,
                      underline: TextDecoration.none,
                    ),
                    Container(
                      height: 20,
                      width: 45,
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 3, right: 2,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:
                          [
                            TextUtils(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              text: "$rate",
                              color: Colors.white,
                              underline: TextDecoration.none,
                            ),
                            const Icon(
                              Icons.star,
                              size: 13,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ) ,
      ),
    );
  }
}

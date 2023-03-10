import 'package:application_mobile/logic/controllers/category_controller.dart';
import 'package:application_mobile/utils/theme.dart';
import 'package:application_mobile/view/widgets/category/category_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryWidget extends StatelessWidget
{
  CategoryWidget({Key? key}) : super(key: key);
  final controller = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context)
  {
    return Obx(() {
      if(controller.isCategoryLoading.value)
      {
        return const Center(
          child: CircularProgressIndicator(
            color: mainColor,
          ),
        );
      } else
         {
           return Expanded(
             child: ListView.separated(
               itemBuilder: (context, index)
               {
                 return InkWell(
                   onTap: ()
                   {
                     controller.getCategoryIndex(index);
                     Get.to( () => CategoryItems(
                       categoryTitle: controller.categoryNameList[index],
                     ),);
                   },
                   child: Container(
                     height: 150,
                     width: double.infinity,
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(10),
                       image: DecorationImage(
                         image: NetworkImage(
                           controller.imageCategory[index],
                         ),
                         fit: BoxFit.cover,
                       ),
                     ),
                     child: Padding(
                       padding: const EdgeInsets.only(left: 20, bottom: 10,),
                       child: Align(
                         alignment: Alignment.bottomLeft,
                         child: Text(
                           controller.categoryNameList[index],
                           style: const TextStyle(
                             color: Colors.white,
                             backgroundColor: Colors.black38,
                             fontSize: 22,
                             fontWeight: FontWeight.bold,
                           ),
                         ),
                       ),
                     ),
                   ),
                 );
               },
               separatorBuilder: (context, index)
               {
                 return const SizedBox(
                   height: 20,
                 );
               },
               itemCount: controller.categoryNameList.length,
             ),
           );
         }
    });
  }
}

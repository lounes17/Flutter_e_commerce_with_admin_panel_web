import 'package:application_mobile/logic/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchFormText extends StatelessWidget
{
  SearchFormText ({Key? key}) : super(key: key);
  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context)
{
    return GetBuilder<ProductController>(
        builder: (_)
        =>  TextField(
          controller: controller.searchTextController,
          cursorColor: Colors.black,
          keyboardType: TextInputType.text,
          onChanged: (searchName)
          {
            controller.addSearchToList(searchName);
          },
          decoration: InputDecoration(
            fillColor: Colors.black45,
            focusColor: Colors.red,
            prefixIcon: const Icon(Icons.search,color: Colors.black,),
            suffixIcon: controller.searchTextController.text.isNotEmpty ?
             IconButton(
              onPressed: ()
              {
                controller.clearSearch();
              },
              icon: const Icon(Icons.close,color: Colors.black,),) : null,
            hintText: "Search with name & price ".tr,

            hintStyle: const TextStyle(
              color: Colors.black45,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),

            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),

            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),

            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),

            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),

          ),
        ),
    );
  }
}

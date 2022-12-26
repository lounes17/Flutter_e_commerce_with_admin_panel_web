import 'package:application_mobile/utils/theme.dart';
import 'package:application_mobile/view/widgets/home/card_items.dart';
import 'package:application_mobile/view/widgets/home/search_text_form.dart';
import 'package:application_mobile/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget
{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return SafeArea(
        child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          body: Column(
            children:
            [
              Container(
                width: double.infinity,
                height: 180,
                decoration: const BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      TextUtils(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          text: "Find your ".tr,
                          color: Colors.white,
                          underline: TextDecoration.none,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextUtils(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        text: "INSPIRATION ",
                        color: Colors.white,
                        underline: TextDecoration.none,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SearchFormText(),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: TextUtils(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      text: "Products".tr,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      underline: TextDecoration.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CardItems(),
            ],
          ),
        ),
    );
  }
}

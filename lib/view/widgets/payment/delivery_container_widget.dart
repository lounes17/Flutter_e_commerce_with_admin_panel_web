import 'package:application_mobile/logic/controllers/auth_controller.dart';
import 'package:application_mobile/logic/controllers/payment_controller.dart';
import 'package:application_mobile/routes/routes.dart';
import 'package:application_mobile/utils/theme.dart';
import 'package:application_mobile/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryContainerWidget extends StatefulWidget
{
  const DeliveryContainerWidget({Key? key}) : super(key: key);

  @override
  State<DeliveryContainerWidget> createState() => _DeliveryContainerWidgetState();
}

class _DeliveryContainerWidgetState extends State<DeliveryContainerWidget>
{
  final TextEditingController phoneController = TextEditingController();
  int radioContainerIndex = 1;
  bool changeColors = false;
  final controller = Get.find<PaymentController>();
  final authController = Get.find<AuthController>();


  @override
  Widget build(BuildContext context)
  {
    return Column(
      children:
      [
        buildRadioContainer(
          icon: Container(),
          address: "Geni cider nouvelle ville Tizi Ouzou",
          value: 1,
          color: changeColors ? Colors.white : Colors.grey.shade300,
          onChanged: ( int? value )
          {
            setState(()
            {
              radioContainerIndex = value!;
              changeColors = !changeColors;
            });
          },
          name: "Anis store",
          title: "BACHA Shop",
          phone: "0698640545",
        ),
        const SizedBox(height: 10,),
        Obx(()
        => buildRadioContainer(
          icon: InkWell(
            onTap: ()
            {
              Get.defaultDialog(
                title: "Enter your phone number".tr,
                titleStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
                backgroundColor: Colors.white,
                radius: 10,
                cancelTextColor: Colors.black,
                textCancel: " Cancel ".tr,
                confirmTextColor: Colors.black,
                textConfirm: " Save ".tr,
                onCancel: ()
                {
                  Get.offNamed(Routes.paymentScreen);
                },
                onConfirm: ()
                {
                  Get.back();
                  controller.phoneNumber.value = phoneController.text;
                },
                content: Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: phoneController,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    onSubmitted: (value)
                    {
                      phoneController.text = value;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.grey,
                      focusColor: Colors.red,
                      prefixIcon: const Icon(Icons.phone,color: Colors.black,),
                      suffixIcon: IconButton(
                        onPressed: ()
                        {
                          phoneController.clear();
                        },
                        icon: const Icon(Icons.close,color: Colors.black,),
                      ),
                      hintText: "Enter your phone number".tr,
                      hintStyle: const TextStyle(
                        color: Colors.black45,
                        fontSize: 14,
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
                ),
              );
            },
            child: const Icon(
              Icons.contact_phone,
              size: 20,
              color: mainColor,
            ),
          ),
          address: controller.address.value,
          value: 2,
          color: changeColors ? Colors.grey.shade300  :Colors.white,
          onChanged: ( int? value )
          {
            setState(()
            {
              radioContainerIndex = value!;
              changeColors = !changeColors;
            });
            controller.updatePosition();
          },
          name: authController.displayUserName.value,
          title: "Delivery".tr,
          phone: controller.phoneNumber.value,
        ),
        ),
      ],
    );
  }






  Widget buildRadioContainer(
  {
    required Color color,
    required int value,
    required Function onChanged,
    required String name,
    required String title,
    required String phone,
    required String address,
    required Widget icon,

  })
  {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        boxShadow:
        [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3.0,
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          Radio(
              value: value,
              fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
              groupValue: radioContainerIndex,
              onChanged: (int ?value)
              {
                onChanged(value);
              },
          ),
          const SizedBox(width: 10,),
          Padding(
              padding: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                TextUtils(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    text: title,
                    color: Colors.black,
                    underline: TextDecoration.none,
                ),
                const SizedBox(height: 5,),
                TextUtils(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  text: name,
                  color: Colors.black,
                  underline: TextDecoration.none,
                ),
                const SizedBox(height: 5,),
                Row(
                  children:
                  [
                    const Text("🇩🇿+213 ",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    TextUtils(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      text: phone,
                      color: Colors.black,
                      underline: TextDecoration.none,
                    ),
                    const SizedBox(width: 120,),
                    SizedBox(
                      child: icon,
                    ),
                  ],
                ),
                const SizedBox(height: 5,),
                TextUtils(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  text: address,
                  color: Colors.black,
                  underline: TextDecoration.none,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

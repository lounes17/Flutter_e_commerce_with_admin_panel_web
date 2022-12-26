import 'package:application_mobile/utils/theme.dart';
import 'package:application_mobile/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';

class PaymentMethodWidget extends StatefulWidget
{
   const PaymentMethodWidget({Key? key}) : super(key: key);

  @override
  State<PaymentMethodWidget> createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget>
{

  int radioPaymentIndex = 1;


  @override
  Widget build(BuildContext context)
  {
    return Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children:
        [
          buildRadioPayment(
            name: "Paypal",
            image: "assets/images/paypal.png",
            scale: 0.7,
            value: 1,
            onChange: (int? value)
            {
              setState(()
              {
                radioPaymentIndex = value!;
              });
            }
          ),
          const SizedBox(height: 20,),
          buildRadioPayment(
              name: "Visa",
              image: "assets/images/credit.png",
              scale: 0.7,
              value: 2,
              onChange: (int? value)
              {
                setState(()
                {
                  radioPaymentIndex = value!;
                });
              }
          ),


        ],
      ),
    );
  }



  Widget buildRadioPayment(
  {
    required String image,
    required double scale,
    required String name,
    required int value,
    required Function onChange,

  })
  {
    return Container(
      width: double.infinity,
      height: 50,
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
        [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Image.asset(
                image,
                scale: scale,
              ),
              const SizedBox(width: 10,),
              TextUtils(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  text: name,
                  color: Colors.black,
                  underline: TextDecoration.none,
              ),
            ],
          ),
          Radio(
              fillColor: MaterialStateColor.resolveWith((states) => mainColor),
              value: value,
              groupValue: radioPaymentIndex,
              onChanged: ( int? value )
              {
                onChange(value);
              },
          ),
        ],
      ),
    );
  }
}

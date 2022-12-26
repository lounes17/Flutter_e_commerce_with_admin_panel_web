import 'package:application_mobile/logic/bindings/auth_binding.dart';
import 'package:application_mobile/logic/bindings/main_binding.dart';
import 'package:application_mobile/logic/bindings/product_binding.dart';
import 'package:application_mobile/view/screens/auth/forgot_password_screen.dart';
import 'package:application_mobile/view/screens/auth/login_screen.dart';
import 'package:application_mobile/view/screens/auth/signup_screen.dart';
import 'package:application_mobile/view/screens/cart_screen.dart';
import 'package:application_mobile/view/screens/main_screen.dart';
import 'package:application_mobile/view/screens/payment_screen.dart';
import 'package:application_mobile/view/screens/welcome_screen.dart';
import 'package:get/get.dart';

class AppRoutes
{

  static const welcome = Routes.welcomeScreen;
  static const mainScreen = Routes.mainScreen;



  static final routes =
  [

    GetPage(
      name: Routes.welcomeScreen,
      page: () => const WelcomeScreen(),
    ),

    GetPage(
      name: Routes.loginScreen,
      page: () =>  LoginScreen(),
      binding: AuthBinding(),
    ),

    GetPage(
      name: Routes.signUpScreen,
      page: () =>  SignUpScreen(),
      binding: AuthBinding(),
    ),

    GetPage(
      name: Routes.forgotPasswordScreen,
      page: () =>  ForgotPasswordScreen(),
      binding: AuthBinding(),
    ),


    GetPage(
      name: Routes.mainScreen,
      page: () =>  MainScreen(),
      bindings:
      [
        AuthBinding(),
        MainBinding(),
        ProductBinding(),
      ],
    ),


    GetPage(
      name: Routes.cartScreen,
      page: () =>  CartScreen(),
      bindings:
      [
        AuthBinding(),
        ProductBinding(),
      ],
    ),




    GetPage(
      name: Routes.paymentScreen,
      page: () =>  PaymentScreen(),
      bindings:
      [
        AuthBinding(),
        ProductBinding(),
        MainBinding(),
      ],
    ),



  ];


}



class Routes
{
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
  static const forgotPasswordScreen = '/forgotPasswordScreen';
  static const mainScreen = '/mainScreen';
  static const cartScreen = '/cartScreen';
  static const paymentScreen = '/paymentScreen';
}
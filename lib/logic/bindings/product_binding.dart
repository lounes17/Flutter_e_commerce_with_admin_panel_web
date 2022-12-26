import 'package:application_mobile/logic/controllers/cart_controller.dart';
import 'package:application_mobile/logic/controllers/category_controller.dart';
import 'package:application_mobile/logic/controllers/product_controller.dart';
import 'package:get/get.dart';

class ProductBinding extends Bindings
{
  @override
  void dependencies()
  {
    Get.put(ProductController());
    Get.lazyPut(() => CartController());
    Get.put(CategoryController());
  }
}
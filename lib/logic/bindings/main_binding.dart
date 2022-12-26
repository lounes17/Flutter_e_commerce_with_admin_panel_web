import 'package:application_mobile/logic/controllers/main_controller.dart';
import 'package:application_mobile/logic/controllers/payment_controller.dart';
import 'package:application_mobile/logic/controllers/settings_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings
{
  @override
  void dependencies()
  {
    Get.put(MainController());
    Get.put(SettingController());
    Get.put(PaymentController(), permanent: true);
  }
}

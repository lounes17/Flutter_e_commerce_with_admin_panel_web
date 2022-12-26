
import 'package:application_mobile/view/screens/category_screen.dart';
import 'package:application_mobile/view/screens/favorites_screen.dart';
import 'package:application_mobile/view/screens/home_screen.dart';
import 'package:application_mobile/view/screens/settings_screen.dart';
import 'package:get/get.dart';

class MainController extends GetxController
{
  RxInt currentIndex = 0.obs;

  final tabs =
      [
        HomeScreen(),
        CategoryScreen(),
        FavoritesScreen(),
        SettingsScreen(),

      ].obs;

  final title =
      [
        "BACHA Shop",
        "Catagories".tr,
        "Favorites".tr,
        "Settings".tr,
        "Admin",
      ].obs;

}
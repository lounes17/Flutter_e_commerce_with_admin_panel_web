import 'package:application_mobile/utils/my_string.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';



class SettingController extends GetxController
{
  var switchValue = false.obs;
  var storage = GetStorage();
  var langLocal = ene;



  String capitalize(String profileName)
  {
    return profileName.split(" ").map((name) => name.capitalize).join(" ");
  }



  @override
  void onInit() async
  {
    super.onInit();
    langLocal = await getLanguage;
  }



  void saveLanguage(String lang) async
  {
    await storage.write("lang", lang);
  }




  Future<String> get getLanguage async
  {
    return await storage.read("lang");
  }




  void changeLanguage(String typeLang)
  {
    saveLanguage(typeLang);
    if (langLocal == typeLang)
    {
      return;
    }
    if (langLocal == frf)
    {
      langLocal = frf;
      saveLanguage(frf);
    } else if (typeLang == ene)
    {
      langLocal = ene;
      saveLanguage(ene);
    }
    update();
  }
}
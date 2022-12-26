import 'package:application_mobile/language/localization.dart';
import 'package:application_mobile/routes/routes.dart';
import 'package:application_mobile/utils/my_string.dart';
import 'package:application_mobile/utils/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Application mobile',
      debugShowCheckedModeBanner: false,
      locale: Locale(GetStorage().read<String>("lang").toString()),
      fallbackLocale: Locale(ene),
      translations: LocalizationApp(),
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      initialRoute: FirebaseAuth.instance.currentUser != null ||
          GetStorage().read<bool>("auth") == true ?
      AppRoutes.mainScreen :
      AppRoutes.welcome,
      getPages: AppRoutes.routes,
    );
  }
}

import 'package:application_mobile/language/en.dart';
import 'package:application_mobile/language/fr.dart';
import 'package:application_mobile/utils/my_string.dart';
import 'package:get/get.dart';

class LocalizationApp extends Translations
{
  @override
  Map<String, Map<String, String>> get keys =>
      {
        ene : en,
        frf : fr,
      };

}
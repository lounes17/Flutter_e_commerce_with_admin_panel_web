import 'package:application_mobile/model/product_models.dart';
import 'package:application_mobile/services/category_services.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController
{
  var categoryNameList = <String>[].obs;
  var isCategoryLoading = false.obs;
  var categoryList = <ProductModels>[].obs;
  var isAllCategory = false.obs;
  List<String> imageCategory =
  [
    "https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_.jpg",
    "https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg",
    "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg",
    "https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg",
  ];

  @override
  void onInit()
  {
    super.onInit();
    getCategories();

  }




  void getCategories() async
  {
    var categoryName = await CategoryServices.getCategory();
    try
    {
      isCategoryLoading(true);
      if(categoryName.isNotEmpty)
      {
        categoryNameList.value = categoryName;
      }
    } finally
       {
         isCategoryLoading(false);
       }

  }



  getAllCategories(String namecategory) async
  {
    isAllCategory(true);
    categoryList.value = await AllCategoryServices.getAllCategory(namecategory);
    isAllCategory(false);

  }

  getCategoryIndex(int index) async
  {
    var categoryAllName = await getAllCategories(categoryNameList[index]);
    if(categoryAllName != null)
      {
        categoryList.value = categoryAllName;
      }
  }




}
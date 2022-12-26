import 'package:application_mobile/model/product_models.dart';
import 'package:application_mobile/services/product_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController
{
  var productList = <ProductModels>[].obs;
  var favoritesList = <ProductModels>[].obs;
  var storage = GetStorage();
  var isLoading = true.obs;
  var searchList = <ProductModels>[].obs;
  TextEditingController searchTextController = TextEditingController();


  @override
  void onInit()
  {
    super.onInit();

    List? storedShoppings = storage.read<List>('isFavouritesList');

    if (storedShoppings != null)
    {
      favoritesList = storedShoppings.map((e) => ProductModels.fromJson(e)).toList().obs;
    }
    getProducts();
  }
  

  void getProducts() async
  {
    var products = await ProductServices.getProduct();
    try
    {
      isLoading(true);
      if(products.isNotEmpty)
      {
        productList.addAll(products);
      }
    } finally
        {
          isLoading(false);
        }
  }


  void manageFavorites(int productId) async
  {
    var existingIndex = favoritesList.indexWhere((element) => element.id == productId);
    if( existingIndex >= 0 )
    {
      favoritesList.removeAt(existingIndex);
      await storage.remove("isFavoritesList");
    } else
    {
      favoritesList.add(productList.firstWhere((element) => element.id == productId),);
      await storage.write("isFavoritesList", favoritesList);
    }
  }


  bool isFavorites(int productId)
  {
    return favoritesList.any((element) => element.id == productId);
  }


  void addSearchToList(String searchName)
  {
    searchName = searchName.toLowerCase();
    searchList.value = productList
        .where( (search)
    {
      var searchTitle = search.title.toLowerCase();
      var searchPrice = search.price.toString().toLowerCase();
      return searchTitle.contains(searchName) || searchPrice.toString().contains(searchName);
    } ).toList();

    update();
  }


  void clearSearch()
  {
    searchTextController.clear();
    addSearchToList("");
  }


}
import 'package:flutter/material.dart';
import 'package:mvvm_provider_shoppingapp/app/model/network/my_response.dart';
import 'package:mvvm_provider_shoppingapp/app/model/product_model.dart';
import 'package:mvvm_provider_shoppingapp/app/repository/product_repository.dart';
import 'package:mvvm_provider_shoppingapp/app/view_model/base_view_model.dart';

class HomePageViewModel extends BaseViewModel {
  ProductRepository prodrepo = ProductRepository();

  bool _isLoading = true;
  bool showClearButton = false;
  List<Product> _prodList = [];
  List<Product> _searchProdList = [];
  List<Product> _filteredProducts = [];
  String category = "";
  List<String> categoryList = [
    '',
    "men's clothing",
    "women's clothing",
    "electronics",
    "jewelery",
  ];
  String _selectedCategory = '';
  Product _productById = Product();

  bool get isLoading => _isLoading;
  List<Product> get prodList => _prodList;
  List<Product> get searchProdList => _searchProdList;
  List<Product> get filteredProducts => _filteredProducts;
  String get selectedCategory => _selectedCategory;
  Product get productById => _productById;

  TextEditingController searchController = TextEditingController();
  String txtSearch = '';

  void settxtsearch(String val) {
    txtSearch = val;
    filterCollect();
  }

  void setProducts(List<Product> products) {
    _prodList = products;
    _filteredProducts = products;
    notifyListeners();
  }

  void filterByCategory(String category) {
    _selectedCategory = category;
    if (category.isEmpty) {
      _filteredProducts = _prodList;
    } else {
      _filteredProducts =
          _prodList.where((product) => product.category == category).toList();
    }
    filterCollect();
  }

  void filterCollect() {
    _searchProdList.clear();
    List<Product> categoryFilteredList = _selectedCategory.isEmpty
        ? _prodList
        : _prodList
            .where((product) => product.category == _selectedCategory)
            .toList();

    for (int i = 0; i < categoryFilteredList.length; i++) {
      if (categoryFilteredList[i].title!.contains(txtSearch) ||
          categoryFilteredList[i].title!.toLowerCase().contains(txtSearch)) {
        _searchProdList.add(categoryFilteredList[i]);
      }
    }
    notifyListeners();
  }

  List<Product> getListToDisplay(HomePageViewModel prodCon) {
    if (prodCon.txtSearch.isNotEmpty) {
      return prodCon.searchProdList;
    } else if (prodCon.selectedCategory.isNotEmpty) {
      return prodCon.filteredProducts;
    } else {
      return prodCon.prodList;
    }
  }

  Future<void> getProductList() async {
    // _isLoading = true;
    // notifyListeners();
    notify(MyResponse.loading());
    final response = await prodrepo.getProductList();
    // if (response.status == ResponseStatus.COMPLETE) {
    _prodList = response.data as List<Product>;
    // }
    _isLoading = false;
    notify(response);
    // notifyListeners();
  }

  Future<void> getProductById(int id) async {
    final response = await prodrepo.getProductById(id) as Product;
    _productById = response;
    notifyListeners();
  }
}

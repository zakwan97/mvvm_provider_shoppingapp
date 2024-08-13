import 'package:mvvm_provider_shoppingapp/app/constant/nav_bar_constant.dart';
import 'package:mvvm_provider_shoppingapp/app/model/network/my_response.dart';
import 'package:mvvm_provider_shoppingapp/app/model/product_model.dart';
import 'package:mvvm_provider_shoppingapp/app/service/product_service.dart';

class ProductRepository {
  final ProductService _productService = ProductService();

  Future<MyResponse<dynamic, dynamic>> getProductList() async {
    final response = await _productService.getProductList();
    // if (response.status == ResponseStatus.COMPLETE) {
    final result = response.data as List<dynamic>;
    final productList = result.map((e) => Product.fromMap(e as Json)).toList();
    return MyResponse.complete(productList);
    // }
    // return response;
  }

  Future<MyResponse<dynamic, dynamic>> getProductById(int id) async {
    final response = await _productService.getProductByID(id);
    if (response.status == ResponseStatus.COMPLETE) {
      final result = response.data as List<dynamic>;
      final productList =
          result.map((e) => Product.fromMap(e as Json)).toList();
      return MyResponse.complete(productList);
    }
    return response;
  }
}

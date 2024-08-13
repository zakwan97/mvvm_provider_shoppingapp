import 'package:mvvm_provider_shoppingapp/app/constant/nav_bar_constant.dart';
import 'package:mvvm_provider_shoppingapp/app/model/network/my_response.dart';
import 'package:mvvm_provider_shoppingapp/app/service/base_service.dart';

class ProductService extends BaseServices {
  final String _baseUrl = 'https://fakestoreapi.com/products';

  Future<MyResponse<dynamic, dynamic>> getProductList() {
    final path = _baseUrl;
    return callAPI(HttpRequestType.GET, path);
  }

  Future<MyResponse<dynamic, dynamic>> getProductByID(int id) {
    final path = '$_baseUrl/$id';
    return callAPI(HttpRequestType.GET, path);
  }
}

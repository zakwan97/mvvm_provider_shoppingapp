import 'package:flutter/material.dart';
import 'package:mvvm_provider_shoppingapp/app/view/base_stateful_page.dart';

class ProductDetailPage extends BaseStatefulPage {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => ProductDetailPageState();
}

class ProductDetailPageState extends BaseStatefulState<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  Widget body() {
    // TODO: implement body
    throw UnimplementedError();
  }

  @override
  Widget? floatingActionButton() {
    // TODO: implement floatingActionButton
    throw UnimplementedError();
  }
}

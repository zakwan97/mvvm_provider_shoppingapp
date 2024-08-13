import 'package:flutter/material.dart';
import 'package:mvvm_provider_shoppingapp/app/view/app_provider.dart';
import 'package:mvvm_provider_shoppingapp/app/view/my_app.dart';

Future<void> main() async {
  runApp(const AppProviders(child: MyApp()));
}

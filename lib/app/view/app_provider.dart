import 'package:flutter/material.dart';
import 'package:mvvm_provider_shoppingapp/app/assets/app_option.dart';
import 'package:provider/provider.dart';

class AppProviders extends StatelessWidget {
  const AppProviders({this.child, super.key});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providerAssets(),
      child: child,
    );
  }
}
